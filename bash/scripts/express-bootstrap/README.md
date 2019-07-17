# Bootstrapping an Express server and React UI

This script makes a pre-configured Express server with a React front-end

## Who this is for

This script is intended for prototyping a server. It's not supposed to be the end all, be all. Just an easy way to get a test server up and running with a UI.

## What this does

- Uses `create-react-app` to give a pre-configured UI.
- Creates a `server/` with Express
- Configures the server to be transpiled and compiled with Babel and Webpack.
- Pre-written scripts for quick start development

## How to use this

### Installation

To use this anywhere, add the `.express-bootstrap` file to your root directory.

- Make sure you are in this repository's root.
  - `pwd` should show you `/express-bootstrap` at the end.
- Copy the file to your root directory, `cp .express-bootstrap ~/`

### Configuration

After that, we can make this executable anywhere in the file tree by adding it to the `.bash_profile`

Edit the `.bash_profile` with your editor, or with the inline editor, nano.

- `nano ~/.bash_profile`

Copy this block into your `.bash_profile`

```bash
function express-init() {
    source ~/..express-bootstrap
}
```

### Usage

After you save the file (`ctrl + o` -> `ctrl + x` if using nano ), source the `.bash_profile` to refresh it's contents

- `source ~/.bash_profile`

The command is now available anywhere within the file tree with `express-init DIRECTORY_NAME_YOU_WANT`

The script will create a directory of your choosing, and fill it's contents.

## Starting Your Server

The commands are listed in `package.json`, but if you're lazy like me, it's nice when its laid out.

- `npm run dev-ui` starts **only** the React Webpack Dev Server
- `npm run dev-server` starts **only** the Express Server
- `npm run dev-both` run both the UI ( port 3000 ) and the Express server ( port 5000 )
