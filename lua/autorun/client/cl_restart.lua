local alpha1, alpha2, alpha3 = 0, 0, 0
local repAlphas = {
    [1] = {0,   0,   0},
    [3] = {130, 255, 0},
    [5] = {0,   0, 255}
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

    local rep = 0

    timer.Create("TransparencyCycle", 0.5, 5, function()
        rep = rep + 1

        local alphas = repAlphas[rep]
        if alphas then
            alpha1, alpha2, alpha3 = alphas[1], alphas[2], alphas[3]
        end

        if rep == 2 or rep == 4 or rep == 5 then
            surface.PlaySound("ambient/alarms/klaxon1.wav")
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