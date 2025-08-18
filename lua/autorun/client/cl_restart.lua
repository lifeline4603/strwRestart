surface.CreateFont("SHITTYFONT", {
    font = "Trebuchet MS",
    size = ScrH() * 0.04,
    weight = 1000,
    antialias = true,
})
net.Receive("strwRestart", function()
    surface.PlaySound("ambient/alarms/klaxon1.wav")
    chat.AddText(
        Color(165, 91, 72), "[strwRestart] ", 
        Color(255, 255, 255), "Server is now restarting..."
    )
    local transparency = 130
    local transparency2 = 255
    local transparency3 = 0
    -- egyptian pyramid, im so fucking sorry but i was so fucking tired
    timer.Simple(0.5, function()
        transparency = 0
        transparency2 = 0
        timer.Simple(0.5, function()
            transparency = 130
            transparency2 = 255
            surface.PlaySound("ambient/alarms/klaxon1.wav")
            timer.Simple(0.5, function()
                transparency = 0
                transparency2 = 0
                timer.Simple(0.5, function()
                    transparency = 130
                    transparency2 = 255
                    surface.PlaySound("ambient/alarms/klaxon1.wav")
                    timer.Simple(0.5, function()
                        transparency = 0
                        transparency2 = 0
                        timer.Simple(0.5, function()
                            transparency3 = 255
                            surface.PlaySound("ambient/explosions/explode_1.wav")
                        end)
                    end)
                end)
            end)
        end)
    end)





    hook.Add("HUDPaint", "lmao", function()

        surface.SetDrawColor(255, 52, 52, transparency)
        surface.DrawRect(0, 0, ScrW(), ScrH())

        draw.SimpleText("SERVER EXPLOSION IMMINENT", "SHITTYFONT", ScrW() / 2, ScrH() / 2, Color(255, 255, 255, transparency2), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(255, 255, 255, transparency3)
        surface.DrawRect(0, 0, ScrW(), ScrH())
    end)
end)