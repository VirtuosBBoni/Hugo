
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.
# scripting ref : https://dev.epicgames.com/documentation/en-us/uefn/verse-language-quick-reference

# A Verse-authored creative device that can be placed in a level
ZoneDeFinDeJeu := class(creative_device):

    @editable
    # (Nom : type = type{})variable référenceant la zone de capture de la carte
    ZoneDevice : capture_area_device = capture_area_device{}

    @editable
    # variable référenceant le device qui fini une partie
    EndGame : end_game_device = end_game_device{}

    var CompteJoueurDansZone : int = 0;

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        Print("Hello, world!")
        Print("2 + 2 = {2 + 2}")
        ZoneDevice.AgentEntersEvent.Subscribe(OnPlayerEnter)    
        

    OnPlayerEnter(InPlayer : agent) : void =
        set CompteJoueurDansZone += 1
        Print("player count {CompteJoueurDansZone}")

        if (CompteJoueurDansZone > 2):
            if:
                FirstPlayer := Self.GetPlayspace().GetPlayers()[0]
            then:
                EndGame.Activate(FirstPlayer)
            else:
                Print("Can't find player")
