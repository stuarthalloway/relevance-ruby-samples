require 'ostruct'

class WidgetsController < ApplicationController
  skip_before_filter :login_required, :login_from_cookie

  # codecite require_login
  before_filter :require_login, :except => "login"
  # codecite require_login
  
  def require_login
    redirect_to :action => "login" unless session[:username]
  end
  
  # codecite dump
  def dump
    @widgets = Widget.find(:all, :order => :name)
    request.format = :xml
  end
  # codecite dump
  
  # codecite login
  def login
    if request.post?
      session[:username] = params[:name]
      flash[:notice] = "Welcome, #{session[:username]}"
      redirect_to widgets_url
    end
    # no else necessary, default behavior does what we want!
  end
  # codecite login
  
  # codecite logout
  def logout
    flash[:notice] = "Goodbye, #{session[:username]}"
    session[:username] = nil
    redirect_to :action => "login"
  end
  # codecite logout
  
  
  # GET /widgets
  # GET /widgets.xml
  # codecite search
  def index
    if params[:search].blank?
      @widgets = Widget.find(:all)
    else
      @widgets = Widget.find_all_by_name(params[:search])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
    end
  end
  # codecite search

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    @widget = Widget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/new
  # GET /widgets/new.xml
  def new
    @widget = Widget.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = Widget.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.xml
  # codecite create
  def create
    @widget = Widget.new(params[:widget])

    respond_to do |format|
      if @widget.save
        flash[:notice] = "Widget #{@widget.name} was successfully created."
        format.html { redirect_to(widgets_url) }
        format.xml  { render :xml => @widget, :status => :created, :location => @widget }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end
  # codecite create

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = Widget.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        flash[:notice] = "Widget #{@widget.name} was successfully updated."
        format.html { redirect_to(widgets_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @widget.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.xml
  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to(widgets_url) }
      format.xml  { head :ok }
    end
  end
end
