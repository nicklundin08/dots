# Battle.net


Dont think theres a direct nix pkg to get bnet on nixos


I installed it as a non-steam game by following these steps


### Steps
BNET
1. Install BNET [here](https://download.battle.net/en-us/?product=bnetdesk)
2. Move to preffered location (I put mine in home dir because Im a degenerate)
3. Add BNET setup applicaiton as non steam game + enforce use of proton
4. Run the application and download BNET (change download location to downloads folder)
  - Might have to go through the Z drive && path separators are probs weird (e.g. mine is `Z:\home\nick\Downloads`)
5. Once complete, close setup app
6. Open steam and add BNET app as a non-steam game (go to location from step 4)
  - Might be in a subdir - look for `Battle.net.exe`
  - Enforce use of proton
  - I had best luck with the experimental one
7. Close all windows
8. Launch Battle.net from steam -> g2g

WOW
1. Follow the steps to install wow

Addons
1. `nix-shell -p wowup-cf`

Customize install (optional)
1. Rename `battle.net.exe` -> `World of Warcraft`
2. [Steamgrid](https://www.steamgriddb.com/)

### Addtional resources
- https://www.youtube.com/watch?v=sntif-gyO_A
- https://www.reddit.com/r/NixOS/comments/1lf9m70/struggiling_to_get_battlenet_running_via_lutris/
