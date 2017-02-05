json.discoveredAppliances do
  json.array! Device.all do |device|
    json.extract! device, :applianceId, :manufacturerName, :modelName, :version, :friendlyName, :friendlyDescription
    json.isReachable true
    arr = ['turnOn', 'turnOff']
    if device.deviceType != '0'
      arr.append('setPercentage')
      arr.append('incrementPercentage')
      arr.append('decrementPercentage')
    end
    json.set! 'actions', arr
  end
end