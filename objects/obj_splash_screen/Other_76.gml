/// @description Insert description here
// rowou can write your code in this editor

if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "seq_end":
            room_goto_next();
    }
}