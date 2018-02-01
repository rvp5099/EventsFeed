class Event < ActiveRecord::Base

  #columns_hash['startdate'] = OpenStruct.new(type: :datetime, klass: DateTime)
  #columns_hash['enddate'] = OpenStruct.new(type: :datetime, klass: DateTime)
  #startdate = DateTime.new(params["startdate(1i)"].to_i, params["startdate(2i)"].to_i, params["startdate(3i)"].to_i, params["startdate(4i)"].to_i, params["startdate(5i)"].to_i)

  #attr_accessor :startdate, :enddate
  #attr_accessible :startdate, :enddate
  #columns_hash["startdate"] = ActiveRecord::ConnectionAdapters::Column.new("startdate", nil, "datetime")
  #columns_hash["enddate"] = ActiveRecord::ConnectionAdapters::Column.new("enddate", nil, "datetime")

  #columns_hash["startdate"]
  #columns_hash["enddate"]

  default_scope :order => "start_date ASC"
  
  validates_presence_of :title
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :notes
  validate :end_date_comes_after_start_date

  def params
    @params
  end
  
  def end_date_comes_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must come after start date")
    end
  end

  #has_many :startdate
  #has_many :enddate

#  def initialize(attributes={})
#    date_hack(attributes, "startdate")
#    date_hack(attributes, "enddate")
#    super(attributes)
#  end

#  def date_hack(attributes, property)
#    keys, values = [], []
#    attributes.each_key {|k| keys << k if k =~ /#{property}/ }.sort
#    keys.each { |k| values << attributes[k]; attributes.delete(k); }
#    attributes[property] = values.join("-")
#  end
  
  def friendly_start_date
    start_date.strftime("%d/%m/%Y")
    #start_date.to_formatted_s(:time)
  end
  
  def friendly_end_date
    end_date.strftime("%d/%m/%Y")
    #end_date.to_formatted_s(:time)
  end
  
  def startdate
#    return super.to_datetime if super.respond_to?(:to_datetime)
#    DateTime.parse(super)
    start_date.to_i
#    #event = params[:event]
#    #startdate = Startdate.new event["startdate(1i)"].to_i, event["startdate(2i)"].to_i, event["startdate(3i)"].to_i, event["startdate(4i)"].to_i, event["startdate(5i)"].to_i
  end
  
  def enddate
#    return super.to_datetime if super.respond_to?(:to_datetime)
#    DateTime.parse(super)
    end_date.to_i
#    #event = params[:event]
#    #enddate = Enddate.new event["enddate(1i)"].to_i, event["enddate(2i)"].to_i, event["enddate(3i)"].to_i, event["enddate(4i)"].to_i, event["enddate(5i)"].to_i
  end

#private
#
#  def post_params
#    params.require(:post).permit(:start_date)
#    params.require(:post).permit(:end_date)
#  end

end