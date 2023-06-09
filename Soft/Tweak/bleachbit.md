https://www.bleachbit.org

устанавливать через менеджер пакетов Synaptic
версия 4.4.2-1

## Install bleachbit Using apt-get[](https://installati.one/install-bleachbit-ubuntu-22-04/#install-bleachbit-using-apt-get)

Update apt database with `apt-get` using the following command.

```bash
sudo apt-get update
```

Copy

After updating apt database, We can install `bleachbit` using `apt-get` by running the following command:

```bash
sudo apt-get -y install bleachbit
```

Copy

## Install bleachbit Using apt[](https://installati.one/install-bleachbit-ubuntu-22-04/#install-bleachbit-using-apt)

Update apt database with `apt` using the following command.

```bash
sudo apt update
```

Copy

After updating apt database, We can install `bleachbit` using `apt` by running the following command:

```bash
sudo apt -y install bleachbit
```

Copy

## Install bleachbit Using aptitude[](https://installati.one/install-bleachbit-ubuntu-22-04/#install-bleachbit-using-aptitude)

If you want to follow this method, you might need to install [aptitude](https://installati.one/ubuntu/22.04/aptitude/) first since aptitude is usually not installed by default on Ubuntu. Update apt database with `aptitude` using the following command.

```bash
sudo aptitude update
```

Copy

After updating apt database, We can install `bleachbit` using `aptitude` by running the following command:

```bash
sudo aptitude -y install bleachbit
```

## How To Uninstall bleachbit on Ubuntu 22.04[](https://installati.one/install-bleachbit-ubuntu-22-04/#how-to-uninstall-bleachbit-on-ubuntu-2204)

To uninstall only the `bleachbit` package we can use the following command:

```bash
sudo apt-get remove bleachbit
```

Copy

### Uninstall bleachbit And Its Dependencies[](https://installati.one/install-bleachbit-ubuntu-22-04/#uninstall-bleachbit-and-its-dependencies)

To uninstall `bleachbit` and its dependencies that are no longer needed by Ubuntu 22.04, we can use the command below:

```bash
sudo apt-get -y autoremove bleachbit
```

Copy

### Remove bleachbit Configurations and Data [](https://installati.one/install-bleachbit-ubuntu-22-04/#remove-bleachbit-configurations-and-data)

To remove `bleachbit` configuration and data from Ubuntu 22.04 we can use the following command:

```bash
sudo apt-get -y purge bleachbit
```

Copy

### Remove bleachbit configuration, data, and all of its dependencies[](https://installati.one/install-bleachbit-ubuntu-22-04/#remove-bleachbit-configuration-data-and-all-of-its-dependencies)

We can use the following command to remove `bleachbit` configurations, data and all of its dependencies, we can use the following command:

```bash
sudo apt-get -y autoremove --purge bleachbit
```