------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------
ESX = nil
local cam = -1 -- Camera control
local heading = 332.219879 -- Heading coord
local zoom = "visage" -- Define which tab is shown first (Default: Head)
local isCameraActive, lastSkin
local FirstSpawn = true
local PlayerLoaded = false
local PrevHat, PrevGlasses, PrevEars, PrevGender, PrevPants, PrevShoes, PrevWatches, PrevTShirt, PrevTorsto, PrevArms
local face

Citizen.CreateThread(
	function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
			Citizen.Wait(0)
		end
	end
)

RegisterNetEvent('masterking32:closeAllUI')
AddEventHandler('masterking32:closeAllUI', function()
	SetNuiFocus(false, false)
	SendNUIMessage(
		{
			openSkinCreator = false
		}
	)
end)

------------------------------------------------------------------
--                          NUI
------------------------------------------------------------------
local SkinMixData, ShapeMixData = 0.5, 0.5
RegisterNUICallback(
	"updateSkin",
	function(data)
		local playerPed = PlayerPedId()
		v = data.value
		-- Face
		dad = tonumber(data.dad)
		mum = tonumber(data.mum)
		gender = tonumber(data.gender)
		skin = tonumber(data.skinMix) / 10
		face = tonumber(data.shapeMix) / 10
		eyecolor = tonumber(data.eyecolor)
		acne = tonumber(data.acne)
		skinproblem = tonumber(data.skinproblem)
		freckle = tonumber(data.freckle)
		wrinkle = tonumber(data.wrinkle)
		wrinkleopacity = tonumber(data.wrinkleopacity)
		hair = tonumber(data.hair)
		haircolor = tonumber(data.haircolor)
		eyebrow = tonumber(data.eyebrow)
		eyebrowopacity = tonumber(data.eyebrowopacity)
		beard = tonumber(data.beard)
		beardopacity = tonumber(data.beardopacity)
		beardcolor = tonumber(data.beardcolor)
		-- Clothes
		hats = tonumber(data.hats)
		hats_texture = tonumber(data.hats_texture)
		glasses = tonumber(data.glasses)
		glasses_texture = tonumber(data.glasses_texture)
		ears = tonumber(data.ears)
		ears_texture = tonumber(data.ears_texture)
		
		tshirts_1 = tonumber(data.tshirts_1)
		tshirts_2 = tonumber(data.tshirts_2)
		
		torso_1 = tonumber(data.torso_1)
		torso_2 = tonumber(data.torso_2)
		
		arms_1 = tonumber(data.arms_1)
		arms_2 = tonumber(data.arms_2)
		
		nose_1 = ((tonumber(data.nose_1) - 10) / 10)
		nose_2 = ((tonumber(data.nose_2) - 10) / 10)
		nose_3 = ((tonumber(data.nose_3) - 10) / 10)
		nose_4 = ((tonumber(data.nose_4) - 10) / 10)
		nose_5 = ((tonumber(data.nose_5) - 10) / 10)
		nose_6 = ((tonumber(data.nose_6) - 10) / 10)
		eyebrows_5 = ((tonumber(data.eyebrows_5) - 10) / 10)
		eyebrows_6 = ((tonumber(data.eyebrows_6) - 10) / 10)
		cheeks_1 = ((tonumber(data.cheeks_1) - 10) / 10)
		cheeks_2 = ((tonumber(data.cheeks_2) - 10) / 10)
		cheeks_3 = ((tonumber(data.cheeks_3) - 10) / 10)
		eye_open = ((tonumber(data.eye_open) - 10) / 10)
		lips_thick = ((tonumber(data.lips_thick) - 10) / 10)
		jaw_1 = ((tonumber(data.jaw_1) - 10) / 10)
		jaw_2 = ((tonumber(data.jaw_2) - 10) / 10)
		chin_height = ((tonumber(data.chin_height) - 10) / 10)
		chin_lenght = ((tonumber(data.chin_lenght) - 10) / 10)
		chin_width = ((tonumber(data.chin_width) - 10) / 10)
		chin_hole = ((tonumber(data.chin_hole) - 10) / 10)
		neck_thick = ((tonumber(data.neck_thick) - 10) / 10)
				
		pants = tonumber(data.pants)
		pants_texture = tonumber(data.pants_texture)
		shoes = tonumber(data.shoes)
		shoes_texture = tonumber(data.shoes_texture)
		watches = tonumber(data.watches)
		watches_texture = tonumber(data.watches_texture)
		
		if freckle == 0 then
			moles_2 = 0
		else
			moles_2 = 10
		end
		
		if (v == true) then
			local ped = playerPed
			local hand = GetPedDrawableVariation(ped, 3)
			local handtext = GetPedTextureVariation(ped, 3)
			local leg = GetPedDrawableVariation(ped, 4)
			local legtext = GetPedTextureVariation(ped, 4)
			local shoes = GetPedDrawableVariation(ped, 6)
			local shoestext = GetPedTextureVariation(ped, 6)
			local accessory = GetPedDrawableVariation(ped, 7)
			local accessorytext = GetPedTextureVariation(ped, 7)
			local undershirt = GetPedDrawableVariation(ped, 8)
			local undershirttext = GetPedTextureVariation(ped, 8)
			local torso = GetPedDrawableVariation(ped, 11)
			local torsotext = GetPedTextureVariation(ped, 11)
			local prop_hat = GetPedPropIndex(ped, 0)
			local prop_hat_text = GetPedPropTextureIndex(ped, 0)
			local prop_glasses = GetPedPropIndex(ped, 1)
			local prop_glasses_text = GetPedPropTextureIndex(ped, 1)
			local prop_earrings = GetPedPropIndex(ped, 2)
			local prop_earrings_text = GetPedPropTextureIndex(ped, 2)
			local prop_watches = GetPedPropIndex(ped, 6)
			local prop_watches_text = GetPedPropTextureIndex(ped, 6)

			local skin_data = {
				["sex"] = gender,
				["face"] = face,
				["skin"] = skin,
				["eye_color"] = eyecolor,
				["complexion_1"] = skinproblem,
				["complexion_2"] = 1,
				["moles_1"] = freckle,
				["moles_2"] = moles_2,
				["age_1"] = wrinkle,
				["age_2"] = wrinkleopacity,
				["eyebrows_1"] = eyebrow,
				["eyebrows_2"] = eyebrowopacity,
				["beard_1"] = beard,
				["beard_2"] = beardopacity,
				["beard_3"] = beardcolor,
				["beard_4"] = beardcolor,
				["hair_1"] = hair,
				["hair_2"] = 0,
				["hair_color_1"] = haircolor,
				["hair_color_2"] = haircolor,
				["arms"] = hand,
				["arms_2"] = handtext,
				["pants_1"] = leg,
				["pants_2"] = legtext,
				["shoes_1"] = shoes,
				["shoes_2"] = shoestext,
				["chain_1"] = accessory,
				["chain_2"] = accessorytext,
				["tshirt_1"] = undershirt,
				["tshirt_2"] = undershirttext,
				["torso_1"] = torso,
				["torso_2"] = torsotext,
				["helmet_1"] = prop_hat,
				["helmet_2"] = prop_hat_text,
				["glasses_1"] = prop_glasses,
				["glasses_2"] = prop_glasses_text,
				["ears_1"] = prop_earrings,
				["ears_2"] = prop_earrings_text,
				["watches_1"] = prop_watches,
				["watches_2"] = prop_watches_text,
				["bproof_1"] = -1,
				["bproof_2"] = -1,
				["mom"] = mum,
				["dad"] = dad,
				["blemishes_1"] = acne,
				["blemishes_2"] = 10,
				["nose_1"] = nose_1,
				["nose_2"] = nose_2,
				["nose_3"] = nose_3,
				["nose_4"] = nose_4,
				["nose_5"] = nose_5,
				["nose_6"] = nose_6,
				["eyebrows_5"] = eyebrows_5,
				["eyebrows_6"] = eyebrows_6,
				["cheeks_1"] = cheeks_1,
				["cheeks_2"] = cheeks_2,
				["cheeks_3"] = cheeks_3,
				["eye_open"] = eye_open,
				["lips_thick"] = lips_thick,
				["jaw_1"] = jaw_1,
				["jaw_2"] = jaw_2,
				["chin_height"] = chin_height,
				["chin_lenght"] = chin_lenght,
				["chin_width"] = chin_width,
				["chin_hole"] = chin_hole,
				["neck_thick"] = neck_thick,
			}
			TriggerServerEvent("esx_skin:save", skin_data)
			TriggerEvent('skinchanger:loadSkin', skin_data)
			Citizen.Wait(1000)

			CloseSkinCreator()
		else
			if PrevGender ~= gender then
				local characterModel

				if gender == 0 then
					TriggerEvent("skinchanger:change", "sex", 0)
				else
					TriggerEvent("skinchanger:change", "sex", 1)
				end
			end
			-- Face
			--TO DO : Add dadmumpercent into skinchanger
			--SetPedHeadBlendData			(playerPed, face, face, face, skin, skin, skin, dadmumpercent * 0.1, dadmumpercent * 0.1, 1.0, true)
			--SetPedHeadBlendData(playerPed, face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)
			SetPedHeadBlendData(playerPed, mum, dad, nil, mum, dad, nil, face, skin, nil, true)
			
			SetPedFaceFeature(playerPed, 0, nose_1)
			SetPedFaceFeature(playerPed, 1, nose_2)
			SetPedFaceFeature(playerPed, 2, nose_3)
			SetPedFaceFeature(playerPed, 3, nose_4)
			SetPedFaceFeature(playerPed, 4, nose_5)
			SetPedFaceFeature(playerPed, 5, nose_6)
			SetPedFaceFeature(playerPed, 6, eyebrows_5)
			SetPedFaceFeature(playerPed, 7, eyebrows_6)
			SetPedFaceFeature(playerPed, 8, cheeks_1)
			SetPedFaceFeature(playerPed, 9, cheeks_2)
			SetPedFaceFeature(playerPed, 10, cheeks_3)
			SetPedFaceFeature(playerPed, 11, eye_open)
			SetPedFaceFeature(playerPed, 12, lips_thick)
			SetPedFaceFeature(playerPed, 13, jaw_1)
			SetPedFaceFeature(playerPed, 14, jaw_2)
			SetPedFaceFeature(playerPed, 15, chin_height)
			SetPedFaceFeature(playerPed, 16, chin_lenght)
			SetPedFaceFeature(playerPed, 17, chin_width)
			SetPedFaceFeature(playerPed, 18, chin_hole)
			SetPedFaceFeature(playerPed, 19, neck_thick)
			
			SetPedEyeColor(playerPed, eyecolor)
			if acne == 0 then
				SetPedHeadOverlay(playerPed, 0, acne, 0.0)
			else
				SetPedHeadOverlay(playerPed, 0, acne, 1.0)
			end
			SetPedHeadOverlay(playerPed, 6, skinproblem, 1.0)
			if freckle == 0 then
				SetPedHeadOverlay(playerPed, 9, freckle, 0.0)
			else
				SetPedHeadOverlay(playerPed, 9, freckle, 1.0)
			end

			SetPedHeadOverlay(playerPed, 3, wrinkle, wrinkleopacity * 0.1)
			SetPedComponentVariation(playerPed, 2, hair, 0, 2)
			SetPedHairColor(playerPed, haircolor, haircolor)
			SetPedHeadOverlay(playerPed, 2, eyebrow, eyebrowopacity * 0.1)
			SetPedHeadOverlay(playerPed, 1, beard, beardopacity * 0.1)
			SetPedHeadOverlayColor(playerPed, 1, 1, beardcolor, beardcolor)
			SetPedHeadOverlayColor(playerPed, 2, 1, beardcolor, beardcolor)

			-- Clothes variations
			if PrevHat ~= hats then
				PrevHat = hats
				hats_texture = 0
				local maxHat
				if hats == 0 then
					maxHat = 0
				else
					maxHat = GetNumberOfPedPropTextureVariations(playerPed, 0, hats) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "helmet_2",
						defaultVal = 0,
						maxVal = maxHat
					}
				)
			end

			if hats == 0 then
				ClearPedProp(playerPed, 0)
			else
				SetPedPropIndex(playerPed, 0, hats, hats_texture, 2)
			end

			if PrevGlasses ~= glasses then
				PrevGlasses = glasses
				glasses_texture = 0
				local maxGlasses
				if glasses == 0 then
					maxGlasses = 0
				else
					maxGlasses = GetNumberOfPedPropTextureVariations(playerPed, 1, glasses) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "glasses_2",
						defaultVal = 0,
						maxVal = maxGlasses
					}
				)
			end
			if glasses == 0 then
				ClearPedProp(playerPed, 1)
			else
				SetPedPropIndex(playerPed, 1, glasses, glasses_texture, 2)
			 --Glasses
			end

			if PrevEars ~= ears then
				PrevEars = ears
				ears_texture = 0
				local maxEars
				if ears == 0 then
					maxEars = 0
				else
					maxEars = GetNumberOfPedPropTextureVariations(playerPed, 2, ears) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "ears_2",
						defaultVal = 0,
						maxVal = maxEars
					}
				)
			end
			if ears == 0 then
				ClearPedProp(playerPed, 2)
			else
				SetPedPropIndex(playerPed, 2, ears, ears_texture, 2)
			end

			if PrevPants ~= pants then
				PrevPants = pants
				pants_texture = 0
				local maxPants
				if pants == 0 then
					maxPants = 0
				else
					maxPants = GetNumberOfPedTextureVariations(playerPed, 4, pants) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "pantalons_2",
						defaultVal = 0,
						maxVal = maxPants
					}
				)
			end

			SetPedComponentVariation(playerPed, 4, pants, pants_texture, 2)

			if PrevShoes ~= shoes then
				PrevShoes = shoes
				shoes_texture = 0
				local maxShoes
				if shoes == 0 then
					maxShoes = 0
				else
					maxShoes = GetNumberOfPedTextureVariations(playerPed, 6, shoes) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "chaussures_2",
						defaultVal = 0,
						maxVal = maxShoes
					}
				)
			end
			

			SetPedComponentVariation(playerPed, 6, shoes, shoes_texture, 2)

			if PrevWatches ~= watches then
				PrevWatches = watches
				watches_texture = 0
				local maxWatches
				if shoes == 0 then
					maxWatches = 0
				else
					maxWatches = GetNumberOfPedPropTextureVariations(playerPed, 6, watches) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "montre_2",
						defaultVal = 0,
						maxVal = maxWatches
					}
				)
			end

			if watches == -1 then
				ClearPedProp(playerPed, 6)
			else
				SetPedPropIndex(playerPed, 6, watches, watches_texture, 2)
			end

			if PrevTShirt ~= tshirts_1 then
				PrevTShirt = tshirts_1
				tshirts_2 = 0
				local maxTShirts
				if tshirts_1 == 0 then
					maxTShirts = 0
				else
					maxTShirts = GetNumberOfPedTextureVariations(playerPed, 6, tshirts_1) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "tshirts_2",
						defaultVal = 0,
						maxVal = maxTShirts
					}
				)
			end

			SetPedComponentVariation(playerPed, 8, tshirts_1, tshirts_2, 2)
			
			if PrevTorsto ~= torso_1 then
				PrevTorsto = torso_1
				torso_2 = 0
				local maxTShirts
				if torso_1 == 0 then
					maxTShirts = 0
				else
					maxTShirts = GetNumberOfPedTextureVariations(playerPed, 6, torso_1) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "torso_2",
						defaultVal = 0,
						maxVal = maxTShirts
					}
				)
			end

			SetPedComponentVariation(playerPed, 11, torso_1, torso_2, 2)
			
			if PrevArms ~= arms_1 then
				PrevArms = arms_1
				arms_2 = 0
				local maxTShirts
				if arms_1 == 0 then
					maxTShirts = 0
				else
					maxTShirts = GetNumberOfPedTextureVariations(playerPed, 6, arms_1) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "arms_2",
						defaultVal = 0,
						maxVal = maxTShirts
					}
				)
			end

			SetPedComponentVariation(playerPed, 3, arms_1, arms_2, 2)
			
			-- Unused yet
			-- These presets will be editable in V2 release
			SetPedHeadOverlay(playerPed, 4, 0, 0.0) -- Lipstick
			SetPedHeadOverlay(playerPed, 8, 0, 0.0) -- Makeup
			SetPedHeadOverlayColor(playerPed, 4, 1, 0, 0) -- Makeup Color
			SetPedHeadOverlayColor(playerPed, 8, 1, 0, 0) -- Lipstick Color
			SetPedComponentVariation(playerPed, 1, 0, 0, 2) -- Mask
		end
	end
)

-- Character rotation
RegisterNUICallback(
	"rotateleftheading",
	function(data)
		local currentHeading = GetEntityHeading(playerPed)
		heading = heading + tonumber(data.value)
	end
)

RegisterNUICallback(
	"rotaterightheading",
	function(data)
		local currentHeading = GetEntityHeading(playerPed)
		heading = heading - tonumber(data.value)
	end
)

-- Define which part of the body must be zoomed
RegisterNUICallback(
	"zoom",
	function(data)
		zoom = data.zoom
	end
)

------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------
function CloseSkinCreator()
	local ped = PlayerPedId()
	ShowSkinCreator(false)
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil

	-- Player
	SetPlayerInvincible(ped, false)
end

function ShowSkinCreator(enable)
	local elements = {}
	TriggerEvent(
		"skinchanger:getData",
		function(components, maxVals)
			local _components = {}
				
			for i = 1, #components, 1 do
				_components[i] = components[i]
			end

			-- Insert elements
			for i = 1, #_components, 1 do
				local value = _components[i].value
				local componentId = _components[i].componentId

				if componentId == 0 then
					value = GetPedPropIndex(playerPed, _components[i].componentId)
				end

				local data = {
					label = _components[i].label,
					name = _components[i].name,
					value = value,
					min = _components[i].min
				}

				for k, v in pairs(maxVals) do
					if k == _components[i].name then
						data.max = v
						break
					end
				end

				table.insert(elements, data)
			end
		end
	)
	isCameraActive = true
	
	-- Disable Controls
	Citizen.CreateThread(function()
		while isCameraActive do
			Citizen.Wait(0)
			if isCameraActive == true then
				DisableControlAction(2, 14, true)
				DisableControlAction(2, 15, true)
				DisableControlAction(2, 16, true)
				DisableControlAction(2, 17, true)
				DisableControlAction(2, 30, true)
				DisableControlAction(2, 31, true)
				DisableControlAction(2, 32, true)
				DisableControlAction(2, 33, true)
				DisableControlAction(2, 34, true)
				DisableControlAction(2, 35, true)
				DisableControlAction(0, 25, true)
				DisableControlAction(0, 24, true)

				local ped = PlayerPedId()

				-- Player
				SetPlayerInvincible(ped, true)

				-- Camera
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				if (not DoesCamExist(cam)) then
					cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
					SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
					SetCamRot(cam, 0.0, 0.0, 0.0)
					SetCamActive(cam, true)
					RenderScriptCams(true, false, 0, true, true)
					SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
				end
				local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
				if zoom == "visage" or zoom == "pilosite" or zoom == "Head" then
					SetCamCoord(cam, x + 0.2, y + 0.5, z + 0.7)
					SetCamRot(cam, 0.0, 0.0, 150.0)
				elseif zoom == "vetements" or zoom == "All" then
					SetCamCoord(cam, x + 0.3, y + 2.0, z + 0.0)
					SetCamRot(cam, 0.0, 0.0, 170.0)
				end
				SetEntityHeading(PlayerPedId(), heading)
			else
				Citizen.Wait(500)
			end
		end
	end)
	
	SetNuiFocus(enable, enable)
	SendNUIMessage(
		{
			openSkinCreator = enable
		}
	)

	for index, data in ipairs(elements) do
		local name, Valmax

		for key, value in pairs(data) do
			if key == "name" then
				name = value
			end
			if key == "max" then
				Valmax = value
			end
		end

		SendNUIMessage(
			{
				type = "updateMaxVal",
				classname = name,
				defaultVal = 0,
				maxVal = Valmax
			}
		)
	end
end

RegisterNetEvent("mskincreator:loadMenu")
AddEventHandler(
	"mskincreator:loadMenu",
	function()
		ShowSkinCreator(true)
	end
)


AddEventHandler(
	"esx:onPlayerSpawn",
	function()
		Citizen.CreateThread(
			function()
				while not PlayerLoaded do
					Citizen.Wait(100)
				end
				if FirstSpawn then
					ESX.TriggerServerCallback(
						"esx_skin:getPlayerSkin",
						function(skin, jobSkin)
							if skin == nil then
								TriggerEvent("skinchanger:loadSkin", {sex = 0})
							else
								TriggerEvent("skinchanger:loadSkin", skin)
							end
						end
					)

					FirstSpawn = false
				end
			end
		)
	end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
	"esx:playerLoaded",
	function(xPlayer)
		PlayerLoaded = true
	end
)

RegisterNetEvent("esx_skin:openSaveableMenu")
AddEventHandler(
	"esx_skin:openSaveableMenu",
	function(submitCb, cancelCb)
		ShowSkinCreator(true)
	end
)

RegisterNetEvent("esx_skin:openSaveableRestrictedMenu")
AddEventHandler(
	"esx_skin:openSaveableRestrictedMenu",
	function(submitCb, cancelCb, restrict)
		OpenSaveableMenu(submitCb, cancelCb, restrict)
	end
)

RegisterNetEvent("esx_skin:requestSaveSkin")
AddEventHandler(
	"esx_skin:requestSaveSkin",
	function()
		TriggerEvent(
			"skinchanger:getSkin",
			function(skin)
				TriggerServerEvent("esx_skin:responseSaveSkin", skin)
			end
		)
	end
)
