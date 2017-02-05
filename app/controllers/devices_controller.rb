class DevicesController < ApplicationController
  def discover
  end

  def index
    @devices = Device.all
    @sensors = [{icon: 'icon-child', value: 4, label: 'People'},
                {icon: 'icon-temperature', value: '70º', label: 'Temperature'},
                {icon: 'icon-rain', value: '3"', label: 'Rain'}]
  end
end
