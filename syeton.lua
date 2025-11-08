-- ============================================
-- 🔥 CxG HUB - PREMIUM FISH IT SCRIPT 🔥
-- ============================================
-- Enhanced Version for Script Pro
-- Game Support: Fish It! (121864768012064)
-- ============================================

local Games = {
    [121864768012064] = function()
        -- Services
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local CoreGui = game:GetService("CoreGui")
        local TweenService = game:GetService("TweenService")
        
        local Player = Players.LocalPlayer
        
        -- ============================================
        -- 🎨 GUI PARENT HELPER (Script Pro Compatible)
        -- ============================================
        local function getSafeGuiParent()
            local success, result = pcall(function()
                if typeof(gethui) == "function" then
                    return gethui()
                end
                if typeof(get_hidden_gui) == "function" then
                    return get_hidden_gui()
                end
                if typeof(syn) == "table" and typeof(syn.protect_gui) == "function" then
                    local gui = Instance.new("ScreenGui")
                    syn.protect_gui(gui)
                    return gui
                end
            end)
            
            if success and result then
                return result
            end
            
            return CoreGui
        end
        
        -- ============================================
        -- 🎨 PREMIUM UI CREATION
        -- ============================================
        local MainGui = Instance.new("ScreenGui")
        MainGui.Name = "CxG_HUB_PREMIUM"
        MainGui.ResetOnSpawn = false
        MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        MainGui.IgnoreGuiInset = true
        MainGui.Parent = getSafeGuiParent()
        
        -- Protect GUI if possible
        pcall(function()
            if syn and syn.protect_gui then
                syn.protect_gui(MainGui)
            end
        end)
        
        -- Main Container
        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 400, 0, 500)
        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
        MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
        MainFrame.BorderSizePixel = 0
        MainFrame.Parent = MainGui
        
        -- Modern Rounded Corners
        local MainCorner = Instance.new("UICorner")
        MainCorner.CornerRadius = UDim.new(0, 12)
        MainCorner.Parent = MainFrame
        
        -- Premium Glow Effect
        local MainStroke = Instance.new("UIStroke")
        MainStroke.Thickness = 2
        MainStroke.Color = Color3.fromRGB(100, 150, 255)
        MainStroke.Transparency = 0.3
        MainStroke.Parent = MainFrame
        
        -- Animated Gradient Background
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 35)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 30))
        })
        Gradient.Rotation = 45
        Gradient.Parent = MainFrame
        
        -- Animate gradient
        spawn(function()
            while MainGui.Parent do
                for i = 0, 360, 2 do
                    Gradient.Rotation = i
                    wait(0.1)
                end
            end
        end)
        
        -- ============================================
        -- 📱 HEADER SECTION
        -- ============================================
        local Header = Instance.new("Frame")
        Header.Size = UDim2.new(1, 0, 0, 60)
        Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Header.BackgroundTransparency = 0.5
        Header.BorderSizePixel = 0
        Header.Parent = MainFrame
        
        local HeaderCorner = Instance.new("UICorner")
        HeaderCorner.CornerRadius = UDim.new(0, 12)
        HeaderCorner.Parent = Header
        
        -- Title with Glow
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -100, 1, 0)
        Title.Position = UDim2.new(0, 15, 0, 0)
        Title.Text = "🔥 CxG HUB PREMIUM 🔥"
        Title.TextColor3 = Color3.fromRGB(255, 200, 0)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 18
        Title.TextStrokeTransparency = 0.5
        Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        Title.Parent = Header
        
        -- Version Badge
        local VersionBadge = Instance.new("Frame")
        VersionBadge.Size = UDim2.new(0, 80, 0, 25)
        VersionBadge.Position = UDim2.new(1, -90, 0, 5)
        VersionBadge.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        VersionBadge.BorderSizePixel = 0
        VersionBadge.Parent = Header
        
        local VersionCorner = Instance.new("UICorner")
        VersionCorner.CornerRadius = UDim.new(0, 8)
        VersionCorner.Parent = VersionBadge
        
        local VersionText = Instance.new("TextLabel")
        VersionText.Size = UDim2.new(1, 0, 1, 0)
        VersionText.Text = "v3.0 PRO"
        VersionText.TextColor3 = Color3.fromRGB(255, 255, 255)
        VersionText.BackgroundTransparency = 1
        VersionText.Font = Enum.Font.GothamBold
        VersionText.TextSize = 11
        VersionText.Parent = VersionBadge
        
        -- Minimize Button
        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
        MinimizeBtn.Position = UDim2.new(1, -35, 0, 30)
        MinimizeBtn.Text = "−"
        MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        MinimizeBtn.Font = Enum.Font.GothamBold
        MinimizeBtn.TextSize = 20
        MinimizeBtn.BorderSizePixel = 0
        MinimizeBtn.Parent = Header
        
        local MinCorner = Instance.new("UICorner")
        MinCorner.CornerRadius = UDim.new(0, 8)
        MinCorner.Parent = MinimizeBtn
        
        -- ============================================
        -- 🎯 TAB SYSTEM
        -- ============================================
        local Tabs = {"Auto Farm", "Teleport", "Player", "Settings"}
        local CurrentTab = "Auto Farm"
        
        local TabContainer = Instance.new("Frame")
        TabContainer.Size = UDim2.new(1, -20, 0, 40)
        TabContainer.Position = UDim2.new(0, 10, 0, 65)
        TabContainer.BackgroundTransparency = 1
        TabContainer.Parent = MainFrame
        
        local TabButtons = {}
        local TabFrames = {}
        
        local ContentFrame = Instance.new("ScrollingFrame")
        ContentFrame.Size = UDim2.new(1, -20, 1, -120)
        ContentFrame.Position = UDim2.new(0, 10, 0, 110)
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.BorderSizePixel = 0
        ContentFrame.ScrollBarThickness = 4
        ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
        ContentFrame.Parent = MainFrame
        
        local ContentList = Instance.new("UIListLayout")
        ContentList.Padding = UDim.new(0, 8)
        ContentList.SortOrder = Enum.SortOrder.LayoutOrder
        ContentList.Parent = ContentFrame
        
        -- Create Tabs
        for i, tabName in ipairs(Tabs) do
            -- Tab Button
            local TabBtn = Instance.new("TextButton")
            TabBtn.Size = UDim2.new(1/#Tabs, -5, 1, 0)
            TabBtn.Position = UDim2.new((i-1)/#Tabs, 0, 0, 0)
            TabBtn.Text = tabName
            TabBtn.BackgroundColor3 = i == 1 and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(40, 40, 60)
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabBtn.Font = Enum.Font.Gotham
            TabBtn.TextSize = 12
            TabBtn.BorderSizePixel = 0
            TabBtn.Parent = TabContainer
            
            local TabBtnCorner = Instance.new("UICorner")
            TabBtnCorner.CornerRadius = UDim.new(0, 8)
            TabBtnCorner.Parent = TabBtn
            
            -- Tab Content Frame
            local TabFrame = Instance.new("Frame")
            TabFrame.Size = UDim2.new(1, 0, 0, 0)
            TabFrame.BackgroundTransparency = 1
            TabFrame.Visible = (i == 1)
            TabFrame.LayoutOrder = i
            TabFrame.Parent = ContentFrame
            
            local TabList = Instance.new("UIListLayout")
            TabList.Padding = UDim.new(0, 8)
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Parent = TabFrame
            
            TabButtons[tabName] = TabBtn
            TabFrames[tabName] = TabFrame
            
            -- Tab Switch
            TabBtn.MouseButton1Click:Connect(function()
                CurrentTab = tabName
                for name, frame in pairs(TabFrames) do
                    frame.Visible = (name == tabName)
                end
                for name, btn in pairs(TabButtons) do
                    local tween = TweenService:Create(
                        btn,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 = name == tabName and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(40, 40, 60)}
                    )
                    tween:Play()
                end
            end)
            
            -- Hover Effect
            TabBtn.MouseEnter:Connect(function()
                if CurrentTab ~= tabName then
                    local tween = TweenService:Create(
                        TabBtn,
                        TweenInfo.new(0.2),
                        {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}
                    )
                    tween:Play()
                end
            end)
            
            TabBtn.MouseLeave:Connect(function()
                if CurrentTab ~= tabName then
                    local tween = TweenService:Create(
                        TabBtn,
                        TweenInfo.new(0.2),
                        {BackgroundColor3 = Color3.fromRGB(40, 40, 60)}
                    )
                    tween:Play()
                end
            end)
        end
        
        -- ============================================
        -- 🎣 AUTO FARM TAB
        -- ============================================
        local AutoFarmFrame = TabFrames["Auto Farm"]
        
        -- Helper function to create toggle buttons
        local function CreateToggle(name, icon, layoutOrder)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, 0, 0, 45)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.LayoutOrder = layoutOrder
            ToggleFrame.Parent = AutoFarmFrame
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 10)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleStroke = Instance.new("UIStroke")
            ToggleStroke.Thickness = 1
            ToggleStroke.Color = Color3.fromRGB(60, 60, 90)
            ToggleStroke.Parent = ToggleFrame
            
            local ToggleBtn = Instance.new("TextButton")
            ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
            ToggleBtn.BackgroundTransparency = 1
            ToggleBtn.Text = ""
            ToggleBtn.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(1, -50, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
            ToggleLabel.Text = icon .. " " .. name .. ": OFF"
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Font = Enum.Font.GothamBold
            ToggleLabel.TextSize = 13
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleIndicator = Instance.new("Frame")
            ToggleIndicator.Size = UDim2.new(0, 35, 0, 20)
            ToggleIndicator.Position = UDim2.new(1, -45, 0.5, -10)
            ToggleIndicator.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
            ToggleIndicator.BorderSizePixel = 0
            ToggleIndicator.Parent = ToggleFrame
            
            local IndicatorCorner = Instance.new("UICorner")
            IndicatorCorner.CornerRadius = UDim.new(0, 10)
            IndicatorCorner.Parent = ToggleIndicator
            
            local IndicatorDot = Instance.new("Frame")
            IndicatorDot.Size = UDim2.new(0, 16, 0, 16)
            IndicatorDot.Position = UDim2.new(0, 2, 0.5, -8)
            IndicatorDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            IndicatorDot.BorderSizePixel = 0
            IndicatorDot.Parent = ToggleIndicator
            
            local DotCorner = Instance.new("UICorner")
            DotCorner.CornerRadius = UDim.new(0, 8)
            DotCorner.Parent = IndicatorDot
            
            local isEnabled = false
            
            ToggleBtn.MouseButton1Click:Connect(function()
                isEnabled = not isEnabled
                
                if isEnabled then
                    ToggleLabel.Text = icon .. " " .. name .. ": ON"
                    ToggleLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 200, 0)}):Play()
                    TweenService:Create(IndicatorDot, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8)}):Play()
                else
                    ToggleLabel.Text = icon .. " " .. name .. ": OFF"
                    ToggleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                    TweenService:Create(ToggleIndicator, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
                    TweenService:Create(IndicatorDot, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8)}):Play()
                end
                
                return isEnabled
            end)
            
            return ToggleBtn, function() return isEnabled end, function(val) isEnabled = val end
        end
        
        -- Create Auto Farm Toggles
        local AutoFishBtn, GetAutoFish, SetAutoFish = CreateToggle("AUTO FISH", "🎣", 1)
        local AutoSellBtn, GetAutoSell, SetAutoSell = CreateToggle("AUTO SELL", "💰", 2)
        local AutoCollectBtn, GetAutoCollect, SetAutoCollect = CreateToggle("AUTO COLLECT", "📦", 3)
        
        -- Fishing Speed Slider
        local SpeedFrame = Instance.new("Frame")
        SpeedFrame.Size = UDim2.new(1, 0, 0, 60)
        SpeedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        SpeedFrame.BorderSizePixel = 0
        SpeedFrame.LayoutOrder = 4
        SpeedFrame.Parent = AutoFarmFrame
        
        local SpeedCorner = Instance.new("UICorner")
        SpeedCorner.CornerRadius = UDim.new(0, 10)
        SpeedCorner.Parent = SpeedFrame
        
        local SpeedLabel = Instance.new("TextLabel")
        SpeedLabel.Size = UDim2.new(1, -20, 0, 25)
        SpeedLabel.Position = UDim2.new(0, 10, 0, 5)
        SpeedLabel.Text = "⚡ Fishing Speed: 3.0s"
        SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SpeedLabel.BackgroundTransparency = 1
        SpeedLabel.Font = Enum.Font.Gotham
        SpeedLabel.TextSize = 12
        SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
        SpeedLabel.Parent = SpeedFrame
        
        local FishingSpeed = 3.0
        
        -- ============================================
        -- 🚀 TELEPORT TAB
        -- ============================================
        local TeleportFrame = TabFrames["Teleport"]
        
        -- Position Display
        local PosFrame = Instance.new("Frame")
        PosFrame.Size = UDim2.new(1, 0, 0, 70)
        PosFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        PosFrame.BorderSizePixel = 0
        PosFrame.LayoutOrder = 1
        PosFrame.Parent = TeleportFrame
        
        local PosCorner = Instance.new("UICorner")
        PosCorner.CornerRadius = UDim.new(0, 10)
        PosCorner.Parent = PosFrame
        
        local PosLabel = Instance.new("TextLabel")
        PosLabel.Size = UDim2.new(1, -20, 1, -10)
        PosLabel.Position = UDim2.new(0, 10, 0, 5)
        PosLabel.Text = "📍 Position:\nX: 0 | Y: 0 | Z: 0"
        PosLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        PosLabel.BackgroundTransparency = 1
        PosLabel.Font = Enum.Font.Gotham
        PosLabel.TextSize = 11
        PosLabel.TextWrapped = true
        PosLabel.TextXAlignment = Enum.TextXAlignment.Left
        PosLabel.Parent = PosFrame
        
        -- Update Position
        RunService.Heartbeat:Connect(function()
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                local pos = Player.Character.HumanoidRootPart.Position
                PosLabel.Text = string.format("📍 Position:\nX: %.1f | Y: %.1f | Z: %.1f", pos.X, pos.Y, pos.Z)
            end
        end)
        
        -- Copy Coordinates Button
        local function CreateTeleportButton(name, position, layoutOrder)
            local TpBtn = Instance.new("TextButton")
            TpBtn.Size = UDim2.new(1, 0, 0, 40)
            TpBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
            TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TpBtn.Text = name
            TpBtn.Font = Enum.Font.GothamBold
            TpBtn.TextSize = 13
            TpBtn.BorderSizePixel = 0
            TpBtn.LayoutOrder = layoutOrder
            TpBtn.Parent = TeleportFrame
            
            local TpCorner = Instance.new("UICorner")
            TpCorner.CornerRadius = UDim.new(0, 10)
            TpCorner.Parent = TpBtn
            
            TpBtn.MouseButton1Click:Connect(function()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
                end
            end)
            
            -- Hover Effect
            TpBtn.MouseEnter:Connect(function()
                TweenService:Create(TpBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 170, 255)}):Play()
            end)
            
            TpBtn.MouseLeave:Connect(function()
                TweenService:Create(TpBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 150, 255)}):Play()
            end)
        end
        
        CreateTeleportButton("🎣 Best Fishing Spot", Vector3.new(0, 0, 0), 2)
        CreateTeleportButton("💰 Sell Area", Vector3.new(49.5, 17.3, 2865.5), 3)
        CreateTeleportButton("🏠 Spawn Point", Vector3.new(0, 0, 50), 4)
        
        -- ============================================
        -- 👤 PLAYER TAB
        -- ============================================
        local PlayerFrame = TabFrames["Player"]
        
        local function CreatePlayerButton(name, icon, layoutOrder, onClick)
            local PBtn = Instance.new("TextButton")
            PBtn.Size = UDim2.new(1, 0, 0, 45)
            PBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
            PBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            PBtn.Text = icon .. " " .. name
            PBtn.Font = Enum.Font.GothamBold
            PBtn.TextSize = 13
            PBtn.BorderSizePixel = 0
            PBtn.LayoutOrder = layoutOrder
            PBtn.Parent = PlayerFrame
            
            local PCorner = Instance.new("UICorner")
            PCorner.CornerRadius = UDim.new(0, 10)
            PCorner.Parent = PBtn
            
            local PStroke = Instance.new("UIStroke")
            PStroke.Thickness = 1
            PStroke.Color = Color3.fromRGB(60, 60, 90)
            PStroke.Parent = PBtn
            
            PBtn.MouseButton1Click:Connect(onClick)
            
            -- Hover Effect
            PBtn.MouseEnter:Connect(function()
                TweenService:Create(PBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 65)}):Play()
            end)
            
            PBtn.MouseLeave:Connect(function()
                TweenService:Create(PBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 45)}):Play()
            end)
            
            return PBtn
        end
        
        CreatePlayerButton("⚡ WalkSpeed: 16", "⚡", 1, function()
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.WalkSpeed = 50
            end
        end)
        
        CreatePlayerButton("🦘 JumpPower: 50", "🦘", 2, function()
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.JumpPower = 100
            end
        end)
        
        -- ============================================
        -- ⚙️ SETTINGS TAB
        -- ============================================
        local SettingsFrame = TabFrames["Settings"]
        
        local AntiAFKBtn, GetAntiAFK, SetAntiAFK = CreateToggle("ANTI-AFK", "🛡", 1)
        
        -- Status Display
        local StatusFrame = Instance.new("Frame")
        StatusFrame.Size = UDim2.new(1, 0, 0, 50)
        StatusFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        StatusFrame.BorderSizePixel = 0
        StatusFrame.LayoutOrder = 2
        StatusFrame.Parent = SettingsFrame
        
        local StatusCorner = Instance.new("UICorner")
        StatusCorner.CornerRadius = UDim.new(0, 10)
        StatusCorner.Parent = StatusFrame
        
        local StatusLabel = Instance.new("TextLabel")
        StatusLabel.Size = UDim2.new(1, -20, 1, -10)
        StatusLabel.Position = UDim2.new(0, 10, 0, 5)
        StatusLabel.Text = "🟢 CxG HUB READY"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        StatusLabel.BackgroundTransparency = 1
        StatusLabel.Font = Enum.Font.GothamBold
        StatusLabel.TextSize = 13
        StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
        StatusLabel.Parent = StatusFrame
        
        -- ============================================
        -- 🎯 DRAGGABLE WINDOW
        -- ============================================
        local isDragging = false
        local dragStart, startPos
        
        Header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
                dragStart = input.Position
                startPos = MainFrame.Position
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = false
            end
        end)
        
        -- Minimize Function
        local isMinimized = false
        MinimizeBtn.MouseButton1Click:Connect(function()
            isMinimized = not isMinimized
            if isMinimized then
                TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 60)}):Play()
                ContentFrame.Visible = false
                MinimizeBtn.Text = "+"
            else
                TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 500)}):Play()
                ContentFrame.Visible = true
                MinimizeBtn.Text = "−"
            end
        end)
        
        -- ============================================
        -- 🎣 AUTO FARM FUNCTIONS
        -- ============================================
        local function FindButton(keyword)
            for _, obj in pairs(game:GetDescendants()) do
                if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                    local text = string.lower(tostring(obj.Text)) .. string.lower(tostring(obj.Name))
                    if string.find(text, string.lower(keyword)) then
                        pcall(function() obj:Click() end)
                        return true
                    end
                end
            end
            return false
        end
        
        -- Auto Fish
        AutoFishBtn.MouseButton1Click:Connect(function()
            local enabled = GetAutoFish()
            SetAutoFish(not enabled)
            
            if not enabled then
                spawn(function()
                    while GetAutoFish() do
                        FindButton("fish")
                        FindButton("cast")
                        wait(FishingSpeed)
                        FindButton("reel")
                        FindButton("pull")
                        wait(1)
                    end
                end)
                StatusLabel.Text = "🎣 AUTO FISH ACTIVATED"
            else
                StatusLabel.Text = "🎣 AUTO FISH DEACTIVATED"
            end
        end)
        
        -- Auto Sell
        AutoSellBtn.MouseButton1Click:Connect(function()
            local enabled = GetAutoSell()
            SetAutoSell(not enabled)
            
            if not enabled then
                spawn(function()
                    while GetAutoSell() do
                        FindButton("sell")
                        wait(5)
                    end
                end)
                StatusLabel.Text = "💰 AUTO SELL ACTIVATED"
            else
                StatusLabel.Text = "💰 AUTO SELL DEACTIVATED"
            end
        end)
        
        -- Auto Collect
        AutoCollectBtn.MouseButton1Click:Connect(function()
            local enabled = GetAutoCollect()
            SetAutoCollect(not enabled)
            
            if not enabled then
                spawn(function()
                    while GetAutoCollect() do
                        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                            for _, obj in pairs(workspace:GetDescendants()) do
                                if obj:IsA("BasePart") and obj.Name:find("Fish") then
                                    local distance = (Player.Character.HumanoidRootPart.Position - obj.Position).Magnitude
                                    if distance < 20 then
                                        Player.Character.HumanoidRootPart.CFrame = obj.CFrame
                                        wait(0.5)
                                    end
                                end
                            end
                        end
                        wait(2)
                    end
                end)
                StatusLabel.Text = "📦 AUTO COLLECT ACTIVATED"
            else
                StatusLabel.Text = "📦 AUTO COLLECT DEACTIVATED"
            end
        end)
        
        -- Anti-AFK
        AntiAFKBtn.MouseButton1Click:Connect(function()
            local enabled = GetAntiAFK()
            SetAntiAFK(not enabled)
            
            if not enabled then
                spawn(function()
                    while GetAntiAFK() do
                        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                            Player.Character.Humanoid:Move(Vector3.new(math.random(-1, 1), 0, math.random(-1, 1)))
                        end
                        wait(30)
                    end
                end)
                StatusLabel.Text = "🛡 ANTI-AFK ACTIVATED"
            else
                StatusLabel.Text = "🛡 ANTI-AFK DEACTIVATED"
            end
        end)
        
        -- Update Content Frame Size
        RunService.Heartbeat:Connect(function()
            local contentSize = 0
            for _, frame in pairs(TabFrames) do
                if frame.Visible then
                    for _, child in pairs(frame:GetChildren()) do
                        if child:IsA("Frame") and child.LayoutOrder then
                            contentSize = contentSize + child.Size.Y.Offset + 8
                        end
                    end
                end
            end
            ContentFrame.CanvasSize = UDim2.new(0, 0, 0, contentSize)
        end)
        
        -- ============================================
        -- 🎉 INITIALIZATION
        -- ============================================
        print("====================================")
        print("🔥 CxG HUB PREMIUM LOADED! 🔥")
        print("🎯 Game ID: 121864768012064")
        print("💪 Version: 3.0 PRO")
        print("✨ Enhanced for Script Pro")
        print("====================================")
        
        StatusLabel.Text = "✅ CxG HUB ACTIVE"
    end,
    
    [123921593837160] = function()
        game.Players.LocalPlayer:Kick("CxG HUB: Climb And Jump support coming soon!")
    end,
    
    [108343567000516] = function()
        game.Players.LocalPlayer:Kick("CxG HUB: Lego Climb support coming soon!")
    end,
    
    [129827112113663] = function()
        game.Players.LocalPlayer:Kick("CxG HUB: Prscpt support coming soon!")
    end
}

-- ============================================
-- 🚀 AUTO EXECUTE
-- ============================================
local currentID = game.PlaceId
local scriptFunction = Games[currentID]

if scriptFunction then
    local success, err = pcall(scriptFunction)
    if not success then
        warn("CxG HUB Error: " .. tostring(err))
    end
else
    game.Players.LocalPlayer:Kick("CxG HUB: Game not supported yet!\nCheck updates for new games.")
end
