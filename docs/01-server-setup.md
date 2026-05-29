# 01 - Initial Server Setup

## Objective

Prepare the Azure VM for hosting a Ruby on Rails web application.

---

## Updating the Server

The following commands were used to update existing packages and install required dependencies.

```bash
sudo apt update
sudo apt upgrade -y
```

### Explanation

- `apt update` refreshes the package lists from Ubuntu repositories.
- `apt upgrade -y` installs the latest available updates automatically.

---

## Installing Required Packages

The following command was used to install the required packages:

```bash
sudo apt install curl git build-essential libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev sqlite3 nodejs npm nginx -y
```

### Explanation

The following packages were installed:

| Package | Purpose |
|----------|----------|
| curl | Download files and scripts from the internet |
| git | Version control and GitHub integration |
| build-essential | Required compilation tools |
| nginx | Web server and reverse proxy |
| nodejs + npm | JavaScript runtime required by Rails |
| sqlite3 | Database used for development |

---

## Verification

The following commands were used to verify successful installation:

```bash
git --version
nginx -v
node -v
npm -v
sqlite3 --version
```

Successful output confirmed that all required packages were installed correctly.

---

## Screenshot

The screenshot below shows the package installation process completing successfully.

![Package Installation](screenshots/app-update.png)