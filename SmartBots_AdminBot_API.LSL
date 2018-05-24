//This is HighVoltageSL Default Set up to start the programming of any SmartBots AdminBot API
//Will update this shortly due to rl time limits!

string SB_VERSION="2.0";
// Setup and startup
integer SB_SETUP_SETGROUP=180101;
integer SB_SETUP_SETGROUPUUID=180102;
integer SB_SETUP_DEBUG=180103;
integer SB_STATUS_QUERY=180104;
integer SB_SETUP_DEVICENAME=180111;
integer SB_SETUP_BOTNAME=180112;
integer SB_SETUP_SETOPTIONS=180113;
// Group members control
integer SB_INVITE_SEND=180105;
integer SB_GROUP_EJECT=180107;
integer SB_AVATAR_GROUP=180114;
integer SB_ADJUST_GROUP_ROLE=180120;
integer SB_GET_GROUP_ROLES=180121;
// Group chat
integer SB_CHAT_SAY=180106;
integer SB_CHAT_LISTEN=180108;
integer SB_CHAT_MUTE=180115;
// Notices
integer SB_NOTICE_SEND=180109;
// Misc. commands
integer SB_RESET_ADMINBOT=9996660;
integer SB_SETUP_SETLINK=180110;

// EVENTS
integer SB_COMMAND_FAILED=180201;
integer SB_STATUS_REPLY=180202;
integer SB_CHAT_MESSAGE=180203;
integer SB_SETUP_SUCCESS=180204;
integer SB_SETUP_FAILED=180205;
integer SB_CHAT_SUCCESS=180206;
integer SB_GROUP_CHECKED=180207;

// Misc. Settings
string deviceName = "Test Device";
key creator = "";
string debug = "1"; //This setting is for debug options in the adminbot script. 1 = Enabled 0 = Disabled

default
{
    on_rez(integer start)
    {
        llOwnerSay("System Rebooting, Please stand by. . .");
        llMessageLinked(LINK_SET, SB_RESET_ADMINBOT, "", NULL_KEY);// Resets the adminbot script
        llResetScript();
    }
    state_entry()
    {
        llMessageLinked(LINK_SET, SB_SETUP_SETLINK, "LINK_THIS", NULL_KEY); //Sets the link message to only talk to scripts in the same prim
        llMessageLinked(LINK_SET, SB_SETUP_DEVICENAME, deviceName, creator);// Sets the device name on the SmartBots Website for stats.
        llMessageLinked(LINK_SET, SB_SETUP_DEBUG, debug, NULL_KEY);// Sends the command to enable and disable the debug setting for the adminbot script
    }
    link_message(integer sender_num, integer num, string str, key id)
    {
        if(num == SB_COMMAND_FAILED)
        {
            llOwnerSay("Event" + (string)num + "arrived! Data:\n" + str);
        }
    }
}
