# A simple battleship game

In this game two players take turns in shooting the opponent's ships.
Depending on ship type, they can take two to 5 direct hits before sinking,
The one to first sink all the enemy's ships is the winner.

The described features may or may not be implemented yet. See the issues to find which ones are actually there.

## Phases
This game's implementation has several states: Greeting, waiting, ship placement, playing.

## Greeting
When unrecognized players visit the page, they are asked to provide a player's name.
Only then they can proceed to the "waiting" state.
Recognized visitors are greeted by name and proceed to "waiting" immediately.

## Waiting

## Ship placement

## Playing

# Development
To start the Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Thanks
Free Software is awesome. Thanks to:

  * https://github.com/davidshimjs/qrcodejs
