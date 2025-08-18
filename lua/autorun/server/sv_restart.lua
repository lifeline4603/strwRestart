util.AddNetworkString("strwRestart")

hook.Add("PlayerSay", "strwRestart_CMD", function(ply, text)
    if string.lower(text) == "!restart" and ply:IsUserGroup("superadmin") or ply:IsUserGroup("admin") then -- idk if this works :: UPDATE: IT WORKS FINE
        net.Start("strwRestart")
        net.Broadcast()
        timer.Simple(3.3, function()
            print("meow1")
            for k, v in ipairs(player.GetAll()) do
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