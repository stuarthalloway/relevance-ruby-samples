class ChangesController < ApplicationController
  # GET /changes
  # GET /changes.xml
  def index
    @changes = Change.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @changes }
    end
  end

  # GET /changes/1
  # GET /changes/1.xml
  def show
    @change = Change.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @change }
    end
  end

  # GET /changes/new
  # GET /changes/new.xml
  def new
    @change = Change.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @change }
    end
  end

  # GET /changes/1/edit
  def edit
    @change = Change.find(params[:id])
  end

  # POST /changes
  # POST /changes.xml
  def create
    @change = Change.new(params[:change])

    respond_to do |format|
      if @change.save
        flash[:notice] = 'Change was successfully created.'
        format.html { redirect_to(@change) }
        format.xml  { render :xml => @change, :status => :created, :location => @change }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /changes/1
  # PUT /changes/1.xml
  def update
    @change = Change.find(params[:id])

    respond_to do |format|
      if @change.update_attributes(params[:change])
        flash[:notice] = 'Change was successfully updated.'
        format.html { redirect_to(@change) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /changes/1
  # DELETE /changes/1.xml
  def destroy
    @change = Change.find(params[:id])
    @change.destroy

    respond_to do |format|
      format.html { redirect_to(changes_url) }
      format.xml  { head :ok }
    end
  end
end
