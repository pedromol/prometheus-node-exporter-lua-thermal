local function scrape()
  local temp = tonumber(get_contents("/sys/devices/virtual/thermal/thermal_zone0/temp"))
  local crit = tonumber(get_contents("/sys/devices/virtual/thermal/thermal_zone0/trip_point_2_temp"))

  local cpu_thermal = metric("node_hwmon_chip_names", "gauge")
  cpu_thermal({chip_name="cpu_thermal", chip="thermal_thermal_zone0"}, 1)

  if temp ~= nil then
    temp = temp / 1000
    local cpu_temp = metric("node_hwmon_temp_celsius", "gauge")
    cpu_temp({sensor="temp0", chip="thermal_thermal_zone0"}, temp)
    cpu_temp({sensor="temp1", chip="thermal_thermal_zone0"}, temp)
    local cpu_therm = metric("node_thermal_zone_temp", "gauge")
    cpu_therm({zone="0", type="cpu_thermal"}, temp)
  end

  if crit ~= nil then
    crit = crit / 1000
    local cpu_crit = metric("node_hwmon_temp_crit_celsius", "gauge")
    cpu_crit({sensor="temp1", chip="thermal_thermal_zone0"}, crit)
  end
end

return { scrape = scrape }
