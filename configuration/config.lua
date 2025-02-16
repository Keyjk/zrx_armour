local seconds, minutes = 1000, 60000
Config = {}

Config.CheckForUpdates = true --| Check for updates?
Config.RemoveArmourOnBreak = true --| Should the vest be removed after no more armour
Config.ForceComponent = true --| Reset player component while armour active
Config.LoadAndSaveArmour = true --| Save armour in database?
Config.Cooldown = 60 --| In seconds
Config.OnPlayerDeathEvent = 'zrx_utility:bridge:onPlayerDeath' --| Event listener
Config.OnPlayerLoadEvent = 'zrx_utility:bridge:playerLoaded' --| First parameter needs the player id

Config.Armour = {
    {
        item = 'bulletproof_small', --| Item name
        usetime = 3 * seconds, --| Usetime
        value = 25, --| 0 - 100 value
        allowedInVehicles = false, --| Enabled?
        allowedJobs = { --| Allowed jobs
            unemployed = true
        },
        vest = {
            female = {
                drawable = 10, --| Vest drawable
                texture = 0 --| Vest texture
            },

            male = {
                drawable = 10, --| Vest drawable
                texture = 0 --| Vest texture
            }
        },
        anim = {
            dict = 'anim@heists@narcotics@funding@gang_idle', --| Dict
            lib = 'gang_chatting_idle01', --| Lib
            flag = 1 --| 1 Full body - 16 Upper body
        }
    },

    {
        item = 'bulletproof_medium', --| Item name
        usetime = 3 * seconds, --| Usetime
        value = 50, --| 0 - 100 value
        allowedInVehicles = false, --| Enabled?
        allowedJobs = { --| Allowed jobs
            unemployed = true
        },
        vest = {
            female = {
                drawable = 10, --| Vest drawable
                texture = 1 --| Vest texture
            },

            male = {
                drawable = 10, --| Vest drawable
                texture = 1 --| Vest texture
            }
        },
        anim = {
            dict = 'anim@heists@narcotics@funding@gang_idle', --| Dict
            lib = 'gang_chatting_idle01', --| Lib
            flag = 1 --| 1 Full body - 16 Upper body
        }
    },

    {
        item = 'bulletproof_big', --| Item name
        usetime = 3 * seconds, --| Usetime
        value = 100, --| 0 - 100 value
        allowedInVehicles = false, --| Enabled?
        allowedJobs = { --| Allowed jobs
            unemployed = true
        },
        vest = {
            female = {
                drawable = 10, --| Vest drawable
                texture = 2 --| Vest texture
            },

            male = {
                drawable = 10, --| Vest drawable
                texture = 2 --| Vest texture
            }
        },
        anim = {
            dict = 'anim@heists@narcotics@funding@gang_idle', --| Dict
            lib = 'gang_chatting_idle01', --| Lib
            flag = 1 --| 1 Full body - 16 Upper body
        }
    }
}

--| Place here your notification
Config.Notification = function(player, msg)
    if IsDuplicityVersion() then
        TriggerClientEvent('esx:showNotification', player, msg, 'info')
    else
        ESX.ShowNotification(msg)
    end
end

--| Place here your punish actions
Config.PunishPlayer = function(player, reason)
    if not IsDuplicityVersion() then return end
    if Webhook.Settings.punish then
        DiscordLog(player, 'PUNISH', reason, 'punish')
    end

    DropPlayer(player, reason)
end

--| Place here your esx Import
Config.EsxImport = function()
	if IsDuplicityVersion() then
		return exports.es_extended:getSharedObject()
	else
		return exports.es_extended:getSharedObject()
	end
end