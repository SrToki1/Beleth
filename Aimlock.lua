local v0=game:GetService("Workspace");local v1=game:GetService("RunService");local v2=game:GetService("UserInputService");local v3=game:GetService("Players");local v4=v3.LocalPlayer;local v5=v4.Character;local v6=v5:FindFirstChild("HumanoidRootPart");local v7=v5:FindFirstChild("Humanoid");local v8=v4:GetMouse();local v9=v0.CurrentCamera;local v10=v4.TeamColor;local v11=false;local v12=false;local v13=false;local v14=0.200;local v15=Vector3.new(0,0.1,0);_G.TeamCheck=false;_G.AimPart="Head";_G.Sensitivity=0;_G.CircleSides=64;_G.CircleColor=Color3.fromRGB(0,128,0);_G.CircleTransparency=3;_G.CircleRadius=200;_G.CircleFilled=false;_G.CircleVisible=true;_G.CircleThickness=1;local v16=Drawing.new("Circle");v16.Position=Vector2.new(v9.ViewportSize.X/2 ,v9.ViewportSize.Y/2 );v16.Radius=_G.CircleRadius;v16.Filled=_G.CircleFilled;v16.Color=_G.CircleColor;v16.Visible=_G.CircleVisible;v16.Transparency=_G.CircleTransparency;v16.NumSides=_G.CircleSides;v16.Thickness=_G.CircleThickness;local function v25()v2.MouseBehavior=Enum.MouseBehavior.LockCenter;end local function v26()v11=false;v12=false;v13=false;v2.MouseBehavior=Enum.MouseBehavior.Default;end function FindNearestPlayer()local v31=math.huge;local v32=nil;for v35,v36 in pairs(v3:GetPlayers()) do if ((v36~=v4) and v36.Character:FindFirstChild("Humanoid") and (v36.Character:FindFirstChild("Humanoid").Health>0) and v36.Character:FindFirstChild("HumanoidRootPart") and v36) then local v37=v36.Character;local v38,v39=v9:WorldToViewportPoint(v37[_G.AimPart].Position);if v39 then local v41=(Vector2.new(v8.X,v8.Y) -Vector2.new(v38.X,v38.Y)).Magnitude;if ((v41<v31) and (v41<v16.Radius)) then v31=v41;v32=v37;end end end end return v32;end v2.InputBegan:Connect(function(v33)if (v33.UserInputType==Enum.UserInputType.MouseButton2) then v11=true;v12=true;v13=true;if v12 then local v40=FindNearestPlayer();while v11 do task.wait(0.000001);if (v13 and (v40~=nil)) then local v42=v40.HumanoidRootPart.CFrame + (v40.HumanoidRootPart.Velocity * v14) + v15 ;v9.CFrame=CFrame.lookAt(v9.CFrame.Position,v42.Position);v25();end end end end end);v2.InputEnded:Connect(function(v34)if (v34.UserInputType==Enum.UserInputType.MouseButton2) then v26();end end);game.StarterGui:SetCore("SendNotification",{Title="Aimlocker Owl",Text=" By 77.#0001",Duration=4});