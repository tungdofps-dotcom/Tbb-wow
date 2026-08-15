local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("UnitScannerMenu") then
    CoreGui.UnitScannerMenu:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UnitScannerMenu"
ScreenGui.Parent = CoreGui

getgenv().CurrentLanguage = "English"

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Position = UDim2.new(0, 20, 0, 100)
ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ToggleButton.Image = "rbxassetid://128028870708904"
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 10)
LogoCorner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 340, 0, 500)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Control Panel"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.Parent = MainFrame

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 30)
TabBar.Position = UDim2.new(0, 10, 0, 38)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local UIListLayoutTab = Instance.new("UIListLayout")
UIListLayoutTab.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutTab.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutTab.Padding = UDim.new(0, 4)
UIListLayoutTab.Parent = TabBar

local TabMainBtn = Instance.new("TextButton")
local TabAutoRespawnBtn = Instance.new("TextButton")
local TabSettingBtn = Instance.new("TextButton")
local TabVipBtn = Instance.new("TextButton")

local function StyleTabBtn(btn, text)
    btn.Size = UDim2.new(0.23, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 12
    btn.Parent = TabBar
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
end

StyleTabBtn(TabMainBtn, "Main")
StyleTabBtn(TabAutoRespawnBtn, "Auto Respawn")
StyleTabBtn(TabSettingBtn, "Setting")
StyleTabBtn(TabVipBtn, "VIP")

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -20, 1, -85)
ContentContainer.Position = UDim2.new(0, 10, 0, 75)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local function CreatePage()
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 5
    page.Visible = false
    page.Parent = ContentContainer
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.Parent = page
    
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
    end)
    return page
end

local PageMain = CreatePage()
local PageAutoRespawn = CreatePage()
local PageSetting = CreatePage()
local PageVip = CreatePage()

PageMain.Visible = true
TabMainBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)

local function SwitchTab(activePage, activeBtn)
    PageMain.Visible = false
    PageAutoRespawn.Visible = false
    PageSetting.Visible = false
    PageVip.Visible = false
    
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabAutoRespawnBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabSettingBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabVipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    activePage.Visible = true
    activeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
end

TabMainBtn.MouseButton1Click:Connect(function() SwitchTab(PageMain, TabMainBtn) end)
TabAutoRespawnBtn.MouseButton1Click:Connect(function() SwitchTab(PageAutoRespawn, TabAutoRespawnBtn) end)
TabSettingBtn.MouseButton1Click:Connect(function() SwitchTab(PageSetting, TabSettingBtn) end)
TabVipBtn.MouseButton1Click:Connect(function() SwitchTab(PageVip, TabVipBtn) end)

local AutoNormanButton = Instance.new("TextButton")
AutoNormanButton.Size = UDim2.new(1, 0, 0, 40)
AutoNormanButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AutoNormanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoNormanButton.Font = Enum.Font.SourceSansBold
AutoNormanButton.TextSize = 14
AutoNormanButton.Parent = PageMain

local NormanCorner = Instance.new("UICorner") NormanCorner.CornerRadius = UDim.new(0, 6) NormanCorner.Parent = AutoNormanButton

local MainLabel = Instance.new("TextLabel")
MainLabel.Size = UDim2.new(1, 0, 0, 50)
MainLabel.BackgroundTransparency = 1
MainLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
MainLabel.Font = Enum.Font.SourceSans
MainLabel.TextSize = 14
MainLabel.TextWrapped = true
MainLabel.Parent = PageMain

local SettingLabel1 = Instance.new("TextLabel")
SettingLabel1.Size = UDim2.new(1, 0, 0, 25)
SettingLabel1.BackgroundTransparency = 1
SettingLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingLabel1.Font = Enum.Font.SourceSansBold
SettingLabel1.TextSize = 14
SettingLabel1.Parent = PageSetting

local NormanSliderBox = Instance.new("TextBox")
NormanSliderBox.Size = UDim2.new(1, 0, 0, 35)
NormanSliderBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NormanSliderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
NormanSliderBox.Font = Enum.Font.SourceSans
NormanSliderBox.TextSize = 14
NormanSliderBox.ClearTextOnFocus = false
NormanSliderBox.Parent = PageSetting

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 6)
SliderCorner.Parent = NormanSliderBox

local SettingLabel2 = Instance.new("TextLabel")
SettingLabel2.Size = UDim2.new(1, 0, 0, 25)
SettingLabel2.BackgroundTransparency = 1
SettingLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingLabel2.Font = Enum.Font.SourceSansBold
SettingLabel2.TextSize = 14
SettingLabel2.Parent = PageSetting

local LangContainer = Instance.new("Frame")
LangContainer.Size = UDim2.new(1, 0, 0, 35)
LangContainer.BackgroundTransparency = 1
LangContainer.Parent = PageSetting

local LangUIList = Instance.new("UIListLayout")
LangUIList.FillDirection = Enum.FillDirection.Horizontal
LangUIList.Padding = UDim.new(0, 10)
LangUIList.Parent = LangContainer

local EnglishBtn = Instance.new("TextButton")
EnglishBtn.Size = UDim2.new(0.48, 0, 1, 0)
EnglishBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
EnglishBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishBtn.Text = "English"
EnglishBtn.Font = Enum.Font.SourceSansBold
EnglishBtn.TextSize = 14
EnglishBtn.Parent = LangContainer
local EngCorner = Instance.new("UICorner") EngCorner.CornerRadius = UDim.new(0, 6) EngCorner.Parent = EnglishBtn

local VietnameseBtn = Instance.new("TextButton")
VietnameseBtn.Size = UDim2.new(0.48, 0, 1, 0)
VietnameseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
VietnameseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VietnameseBtn.Text = "Vietnamese"
VietnameseBtn.Font = Enum.Font.SourceSansBold
VietnameseBtn.TextSize = 14
VietnameseBtn.Parent = LangContainer
local VieCorner = Instance.new("UICorner") VieCorner.CornerRadius = UDim.new(0, 6) VieCorner.Parent = VietnameseBtn

local LoadAllButton = Instance.new("TextButton")
LoadAllButton.Size = UDim2.new(1, 0, 0, 35)
LoadAllButton.BackgroundColor3 = Color3.fromRGB(200, 150, 50) 
LoadAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadAllButton.Font = Enum.Font.SourceSansBold
LoadAllButton.TextSize = 14
LoadAllButton.Parent = PageAutoRespawn

local LoadCorner = Instance.new("UICorner") LoadCorner.CornerRadius = UDim.new(0, 6) LoadCorner.Parent = LoadAllButton

local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(1, 0, 0, 30)
SearchBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.TextSize = 14
SearchBar.ClearTextOnFocus = false
SearchBar.Parent = PageAutoRespawn

local SearchCorner = Instance.new("UICorner") SearchCorner.CornerRadius = UDim.new(0, 6) SearchCorner.Parent = SearchBar

local UnitListScrolling = Instance.new("ScrollingFrame")
UnitListScrolling.Size = UDim2.new(1, 0, 0, 270)
UnitListScrolling.BackgroundTransparency = 1
UnitListScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
UnitListScrolling.ScrollBarThickness = 5
UnitListScrolling.Parent = PageAutoRespawn

local UnitListLayout = Instance.new("UIListLayout")
UnitListLayout.Padding = UDim.new(0, 5)
UnitListLayout.Parent = UnitListScrolling

UnitListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    UnitListScrolling.CanvasSize = UDim2.new(0, 0, 0, UnitListLayout.AbsoluteContentSize.Y)
end)

local WhitelistedUserIDs = {
    11480678076,
    1266874452,
}

local function IsWhitelisted(userId)
    for _, id in ipairs(WhitelistedUserIDs) do
        if id == userId then return true end
    end
    return false
end

local VipStatusLabel = Instance.new("TextLabel")
VipStatusLabel.Size = UDim2.new(1, 0, 0, 40)
VipStatusLabel.BackgroundTransparency = 1
VipStatusLabel.TextColor3 = IsWhitelisted(LocalPlayer.UserId) and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
VipStatusLabel.Font = Enum.Font.SourceSansBold
VipStatusLabel.TextSize = 13
VipStatusLabel.TextWrapped = true
VipStatusLabel.Parent = PageVip

local AutoWinButton = Instance.new("TextButton")
AutoWinButton.Size = UDim2.new(1, 0, 0, 40)
AutoWinButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
AutoWinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoWinButton.Font = Enum.Font.SourceSansBold
AutoWinButton.TextSize = 14
AutoWinButton.Parent = PageVip
local WinCorner = Instance.new("UICorner") WinCorner.CornerRadius = UDim.new(0, 6) WinCorner.Parent = AutoWinButton

local GetBricksButton = Instance.new("TextButton")
GetBricksButton.Size = UDim2.new(1, 0, 0, 40)
GetBricksButton.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
GetBricksButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetBricksButton.Font = Enum.Font.SourceSansBold
GetBricksButton.TextSize = 14
GetBricksButton.Parent = PageVip
local BricksCorner = Instance.new("UICorner") BricksCorner.CornerRadius = UDim.new(0, 6) BricksCorner.Parent = GetBricksButton

getgenv().NormanFireSeconds = 0.5
local isAutoNormanRunning = false

local function UpdateLanguageTexts()
    if getgenv().CurrentLanguage == "English" then
        TabMainBtn.Text = "Main"
        TabAutoRespawnBtn.Text = "Auto Respawn"
        TabSettingBtn.Text = "Setting"
        TabVipBtn.Text = "VIP"
        MainLabel.Text = "Welcome to the Script!"
        SettingLabel1.Text = "Fire Seconds Norman Settings:"
        NormanSliderBox.Text = "Interval (seconds): " .. tostring(getgenv().NormanFireSeconds)
        SettingLabel2.Text = "Language Settings:"
        AutoNormanButton.Text = isAutoNormanRunning and "Auto Norman: ON" or "Auto Norman: OFF"
        LoadAllButton.Text = "Scan All Game Units"
        SearchBar.PlaceholderText = "Search Unit..."
        VipStatusLabel.Text = IsWhitelisted(LocalPlayer.UserId) and "VIP Status: ACCESS GRANTED (ID: " .. LocalPlayer.UserId .. ")" or "VIP Status: ACCESS DENIED (Your ID: " .. LocalPlayer.UserId .. ")"
        AutoWinButton.Text = "Auto Win (Click to Load)"
        GetBricksButton.Text = "Get Bricks 1M (Click to Load)"
    else
        TabMainBtn.Text = "Chính"
        TabAutoRespawnBtn.Text = "Tự Động Hồi Sinh"
        TabSettingBtn.Text = "Cài Đặt"
        TabVipBtn.Text = "VIP"
        MainLabel.Text = "Chào mừng bạn đến với Script!"
        SettingLabel1.Text = "Cài đặt thời gian Auto Norman:"
        NormanSliderBox.Text = "Khoảng thời gian (giây): " .. tostring(getgenv().NormanFireSeconds)
        SettingLabel2.Text = "Cài đặt Ngôn Ngữ:"
        AutoNormanButton.Text = isAutoNormanRunning and "Auto Norman: BẬT" or "Auto Norman: TẮT"
        LoadAllButton.Text = "Quét Toàn Bộ Unit Kho Game"
        SearchBar.PlaceholderText = "Tìm kiếm Unit..."
        VipStatusLabel.Text = IsWhitelisted(LocalPlayer.UserId) and "Trạng thái VIP: ĐÃ CẤP QUYỀN (ID: " .. LocalPlayer.UserId .. ")" or "Trạng thái VIP: TỪ CHỐI (ID của bạn: " .. LocalPlayer.UserId .. ")"
        AutoWinButton.Text = "Tự Động Thắng (Bấm để chạy)"
        GetBricksButton.Text = "Nhận 1M Gạch (Bấm để chạy)"
    end
end

EnglishBtn.MouseButton1Click:Connect(function()
    getgenv().CurrentLanguage = "English"
    EnglishBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    VietnameseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    UpdateLanguageTexts()
end)

VietnameseBtn.MouseButton1Click:Connect(function()
    getgenv().CurrentLanguage = "Vietnamese"
    VietnameseBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    EnglishBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    UpdateLanguageTexts()
end)

UpdateLanguageTexts()

NormanSliderBox.FocusLost:Connect(function()
    local num = tonumber(NormanSliderBox.Text:match("%d+%.?%d*"))
    if num and num > 0 then
        getgenv().NormanFireSeconds = num
    end
    UpdateLanguageTexts()
end)

AutoNormanButton.MouseButton1Click:Connect(function()
    isAutoNormanRunning = not isAutoNormanRunning
    UpdateLanguageTexts()
    if isAutoNormanRunning then
        AutoNormanButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        task.spawn(function()
            while isAutoNormanRunning do
                pcall(function()
                    local args = {
                        [1] = game:GetService("Players").LocalPlayer.Character.Humanoid
                    }
                    game:GetService("ReplicatedStorage").RemoteEvents.SomeDeath:FireServer(unpack(args))
                end)
                task.wait(getgenv().NormanFireSeconds or 0.5)
            end
        end)
    else
        AutoNormanButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

local ScannedUnits = {} 
local AutoLoopUnits = {}
local CurrentActiveUnit = nil 

local function ReplayChangeChar(unitInstance)
    if not unitInstance then return end
    pcall(function()
        local remote = LocalPlayer.PlayerGui.MainGui.RemoteEvent
        if remote and remote:IsA("RemoteEvent") then
            remote:FireServer("ChangeChar", unitInstance)
        end
    end)
end

local function AddUnitToMenu(unitInstance)
    if not unitInstance or typeof(unitInstance) ~= "Instance" then return end
    local unitName = unitInstance.Name

    if ScannedUnits[unitName] then return end
    ScannedUnits[unitName] = unitInstance

    local UnitButton = Instance.new("TextButton")
    UnitButton.Size = UDim2.new(1, 0, 0, 35)
    UnitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    UnitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    UnitButton.Text = unitName
    UnitButton.Font = Enum.Font.SourceSansBold
    UnitButton.TextSize = 14
    UnitButton.Parent = UnitListScrolling

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = UnitButton

    UnitButton.MouseButton1Click:Connect(function()
        if AutoLoopUnits[unitName] then
            AutoLoopUnits[unitName] = nil
            UnitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        else
            AutoLoopUnits[unitName] = unitInstance
            CurrentActiveUnit = unitInstance 
            UnitButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
            ReplayChangeChar(unitInstance)
        end
    end)
end

SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local searchText = string.lower(SearchBar.Text)
    for _, item in ipairs(UnitListScrolling:GetChildren()) do
        if item:IsA("TextButton") then
            if searchText == "" or string.find(string.lower(item.Text), searchText) then
                item.Visible = true
            else
                item.Visible = false
            end
        end
    end
end)

LoadAllButton.MouseButton1Click:Connect(function()
    LoadAllButton.Text = getgenv().CurrentLanguage == "English" and "Scanning all units... Please wait" or "Đang quét toàn bộ unit... Vui lòng đợi"
    local npcFolder = ReplicatedStorage:FindFirstChild("NPC")
    
    if npcFolder then
        for _, obj in ipairs(npcFolder:GetDescendants()) do
            if obj:IsA("Model") then
                AddUnitToMenu(obj)
            end
        end
        LoadAllButton.Text = getgenv().CurrentLanguage == "English" and "Successfully scanned all units!" or "Đã quét toàn bộ unit thành công!"
        task.wait(2)
        LoadAllButton.Text = getgenv().CurrentLanguage == "English" and "Scan All Game Units" or "Quét Toàn Bộ Unit Kho Game"
    else
        LoadAllButton.Text = getgenv().CurrentLanguage == "English" and "NPC folder not found!" or "Không tìm thấy thư mục NPC!"
    end
end)

local function TriggerRespawn()
    for name, unit in pairs(AutoLoopUnits) do
        if unit then
            local waitTime = 1 
            if unit.Name:lower():match("punishment") or (CurrentActiveUnit and CurrentActiveUnit.Name:lower():match("punishment")) then
                waitTime = 2 
            end
            
            task.spawn(function()
                task.wait(waitTime)
                ReplayChangeChar(unit)
            end)
        end
    end
end

local function OnCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.Died:Connect(function()
            TriggerRespawn()
        end)
    end
end

if LocalPlayer.Character then
    OnCharacterAdded(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

LocalPlayer.CharacterRemoving:Connect(function()
    TriggerRespawn()
end)

if hookfunction then
    local oldFireServer
    oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
        local args = {...}
        if tostring(self) == "RemoteEvent" and args[1] == "ChangeChar" and args[2] then
            CurrentActiveUnit = args[2]
            task.spawn(function()
                AddUnitToMenu(args[2])
            end)
        end
        return oldFireServer(self, ...)
    end)
end

AutoWinButton.MouseButton1Click:Connect(function()
    if not IsWhitelisted(LocalPlayer.UserId) then
        AutoWinButton.Text = getgenv().CurrentLanguage == "English" and "Access Denied!" or "Từ chối truy cập!"
        task.wait(2)
        UpdateLanguageTexts()
        return
    end
    
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sangggggg991120-code/01720/refs/heads/main/01829282811816228266226272626338272628272392926262"))()
        AutoWinButton.Text = getgenv().CurrentLanguage == "English" and "Loaded Successfully!" or "Đã tải thành công!"
    end)
end)

GetBricksButton.MouseButton1Click:Connect(function()
    if not IsWhitelisted(LocalPlayer.UserId) then
        GetBricksButton.Text = getgenv().CurrentLanguage == "English" and "Access Denied!" or "Từ chối truy cập!"
        task.wait(2)
        UpdateLanguageTexts()
        return
    end
    
    pcall(function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/idkthispassemail123-create/1c835411e2302ccab7f91c9d403b1812/raw/gistfile1.txt"))()
        GetBricksButton.Text = getgenv().CurrentLanguage == "English" and "Loaded Successfully!" or "Đã tải thành công!"
    end)
end)
