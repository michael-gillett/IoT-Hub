require 'particle'
class ParticleController < ApplicationController
  def contact_device
    photonId = Device.where(applianceId: params[:id]).first.photonId
    case params[:event]
      when "turn_on"
        Particle.device(photonId).function('turn_on', '')
      when "turn_off"
        Particle.device(photonId).function('turn_off', '')
      else
        puts 'Event not found'
    end
    render nothing: true, status: :ok
  end

  def refresh_devices
    Particle.devices.each do |photon|
      if photon.connected? and photon.name == 'tree-photon'
        puts photon.name
         # not photon.variables('device_list').nil?

        device_json_string = JSON.parse(photon.variable('device_list'))
        device_json_string['devices'].each do |device|
          puts device['id'], device['type']
          Device.create(
            applianceId: device['id'],
            manufacturerName: "particle",
            modelName: "particle #{device['type']}",
            version: "1.0",
            friendlyName: device['id'],
            friendlyDescription: "A #{device['type']} connected to #{photon.name}",
            isReachable: "true",
            photonId: photon.id
          )
        end
      end
    end
  end
end