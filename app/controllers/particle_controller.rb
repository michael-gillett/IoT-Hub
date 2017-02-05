require 'particle'
class ParticleController < ApplicationController
  EXEC_MAP = {"turn_off" => "0", "turn_on" => "1", "adjust" => "2"}
  TYPE_MAP = {"0" => "0", "1" => "1", "2" => "2"}

  def contact_device
    device = Device.where(applianceId: params[:id]).first
    photonId = device.photonId
    type = device.deviceType

    state = { id: params[:id],
              t: TYPE_MAP[type],
              e: EXEC_MAP[params[:event]]}

    if params[:event] == "adjust"
      state[:v] = params[:value]
    end

    Particle.device(photonId).function('change_state', state.to_json)
    render nothing: true, status: :ok
  end

  def refresh_devices
    Particle.devices.each do |photon|
      if photon.connected?
        device_json_string = JSON.parse(photon.variable('device_list'))
        device_json_string['devices'].each do |device|
          Device.create(
            applianceId: device['id'],
            manufacturerName: "particle",
            modelName: "particle #{device['t']}",
            version: "1.0",
            friendlyName: "#{device['t']} #{device['id']}",
            friendlyDescription: "A #{device['t']} connected to #{photon.name}",
            isReachable: "true",
            photonId: photon.id,
            deviceType: TYPE_MAP[device['t']]
          )
        end
      end
    end
  end
end