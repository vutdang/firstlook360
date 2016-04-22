# export pins
echo 44 > /sys/class/gpio/export
echo 45 > /sys/class/gpio/export

echo "exports done"

# set ouputs
echo low > /sys/class/gpio/gpio45/direction
echo low > /sys/class/gpio/gpio44/direction

echo "outputs are set"

