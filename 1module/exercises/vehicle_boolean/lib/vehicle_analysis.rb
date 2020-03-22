# vehicle_analysis.rb

class VehicleAnalysis

  def analyze(vehicle)
    puts "Vehicle has four wheels "
    if vehicle.car? 
      vehicle.four_wheel_drive? ? (puts "with four wheel drive") : (puts "with two wheel drive")
    elsif vehicle.tractor?
      puts "with big wheels in the back" if vehicle.big_back_wheels?
    elsif vehicle.pickup?
      vehicle.four_wheel_drive? ? (puts "with four wheel drive") : (puts "with two wheel drive")
      puts "with big wheels in the back" if vehicle.big_back_wheels?
    end
  end

end
