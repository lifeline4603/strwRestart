util.AddNetworkString("strwRestart")

hook.Add("PlayerSay", "strwRestart_CMD", function(ply, text)
    if string.lower(text) == "!restart" and ply:IsAdmin() then -- Returns true if admin, or superadmin
        net.Start("strwRestart")
        net.Broadcast()
        timer.Simple(3.3, function() -- There's def a better way to do this.. I just don't know what yet..
            print("meow1")
            for _, v in player.Iterator() do
                v:Kick("Lost connection to host")
            end
            print("meow2")
            timer.Simple(0.2, function()
                while true do end -- this will crash it, make sure u have a backplan to automatically start the server if looped.
            end)
        end)
        return ""
    end
end)