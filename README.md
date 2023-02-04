# prometheus-node-exporter-lua-thermal

Thermal metrics exporter for [Prometheus](https://prometheus.io/docs/introduction/overview/) on [OpenWrt](https://openwrt.org/)

## Prerequisite

Install Prometheus node exporter on your OpenWrt distribution. A nice article about that can be found [here](https://grafana.com/blog/2021/02/09/how-i-monitor-my-openwrt-router-with-grafana-cloud-and-prometheus/).

## Installation

Drop thermal.lua file at prometheus collectors location and restart the prometheus service. *Default /usr/lib/lua/prometheus-collectors/*

## Usage

After the installation, **node_hwmon_*** metrics will be exposed by the collector. You may use a community [Grafana](https://grafana.com/) based dashboard like [this](https://grafana.com/grafana/dashboards/12950-hwmon/)