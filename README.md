## How to use

1. Git clone this repo into your machine.

(In case you've cloned before, run `git fetch`  & `git pull` before proceeding.

3. Copy the AAR file into the root folder of this repo (aar-repo)

4. Run the script<br>
`chmod +x prepare_aar.sh`<br>
`./prepare_aar.sh`

5. Enter the aar information,
  example: `com.andrognito.patternlockview:patternlockview:1.0.0`

6. Enter AAR file name that you've just copied into this folder.

7. Voila! the script will generate pom file of this AAR and build it's structure and will push to git.
