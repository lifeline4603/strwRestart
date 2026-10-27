local alpha1, alpha2, alpha3 = 0, 0, 0

local steps = {
    {0,   0,   0},
    {130, 255, 0, "ambient/alarms/klaxon1.wav"},
    {0,   0,   0},
    {130, 255, 0, "ambient/alarms/klaxon1.wav"},
    {0,   0,   0},
    {0,   0,   255, "ambient/explosions/explode_1.wav"}
}

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

    alpha1, alpha2, alpha3 = 130, 255, 0
    local rep = 0

    timer.Create("TransparencyCycle", 0.5, #steps, function()
        rep = rep + 1

        local step = steps[rep]
        alpha1, alpha2, alpha3 = step[1], step[2], step[3]

        if step[4] then
            surface.PlaySound(step[4])
        end
    end)

    hook.Add("HUDPaint", "lmao", function()
        surface.SetDrawColor(255, 52, 52, alpha1)
        surface.DrawRect(0, 0, ScrW(), ScrH())

        draw.SimpleText(
            "SERVER EXPLOSION IMMINENT",
            "SHITTYFONT",
            ScrW() / 2, ScrH() / 2,
            Color(255, 255, 255, alpha2),
            TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER
        )

        surface.SetDrawColor(255, 255, 255, alpha3)
        surface.DrawRect(0, 0, ScrW(), ScrH())
    end)
end)
