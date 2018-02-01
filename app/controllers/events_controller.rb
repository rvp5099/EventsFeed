class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events.to_json(:methods => [:start_date, :end_date], :except => [:created_at, :updated_at, :id, :start_date, :end_date]) }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

#params[:events][:startdate] = Datetime.local(params[:events][:"startdate(1i)"].to_i, params[:events][:"startdate(2i)"].to_i, params[:events][:"startdate(3i)"].to_i, params[:events][:"startdate(4i)"].to_i, params[:events][:"startdate(5i)"].to_i)

   #clean up to avoid multivariable error
   #params[:events].delete(:"startdate(1i)")
   #params[:events].delete(:"startdate(2i)")
   #params[:events].delete(:"startdate(3i)")
   #params[:events].delete(:"startdate(4i)")
   #params[:events].delete(:"startdate(5i)")

#params[:events][:enddate] = Datetime.local(params[:events][:"enddate(1i)"].to_i, params[:events][:"enddate(2i)"].to_i, params[:events][:"enddate(3i)"].to_i, params[:events][:"enddate(4i)"].to_i, params[:events][:"enddate(5i)"].to_i)

   #clean up to avoid multivariable error
   #params[:events].delete(:"enddate(1i)")
   #params[:events].delete(:"enddate(2i)")
   #params[:events].delete(:"enddate(3i)")
   #params[:events].delete(:"enddate(4i)")
   #params[:events].delete(:"enddate(5i)")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    #@event.startdate = DateTime.new(params["startdate(1i)"].to_i, params["startdate(2i)"].to_i, params["startdate(3i)"].to_i, params["startdate(4i)"].to_i, params["startdate(5i)"].to_i)

    #@event.startdate = Datetime.strptime("#{params['startdate(3i)']}/#{params['startdate(2i)']}/#{params['startdate(1i)']}", "%d/%m/%y")
    #@event.enddate = Datetime.strptime("#{params['enddate(3i)']}/#{params['enddate(2i)']}/#{params['enddate(1i)']}", "%d/%m/%y")

    respond_to do |format|
      if @event.save
        format.html { redirect_to "/events", :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to "/events", :notice => 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
