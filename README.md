# Desolation Redux Extended Logging
Extended logging for Arma 3 Desolation Redux mod using A3Log

### Current logging:

* Kills

```[2017-07-23 / 12:44:09] Type: Murder KillerUID: 76561198235234578 KillerName: Sn1per DeadUID: 76561198235487130 DeadName: Frankie Weapon: srifle_DMR_01_F Zeroing: 400 AmmoDetail: "7.62mm 10Rnd Mag(8/10)[id/cr:10000190/3]" Distance: 426 Location: 105130 Elektrozavodsk```

Adds detailed logging for your Desolation Redux server using A3Log tool by Arkensor download and see information [here](https://forums.bistudio.com/forums/topic/189554-a3log-a-lightweight-logging-extension/)

### Install guide:

1. Download A3Log from the [link here](https://forums.bistudio.com/forums/topic/189554-a3log-a-lightweight-logging-extension/)

2. Follow the instructions given in that opening post (Unblock the .dll files, add @a3Log to your server startup params-> "-servermod=@DesolationServer;@A3Log", delete A3Log_examples.pbo inside @A3Log/addons)

3. Only once you have followed the A3log instructions, place the ``\Desolation-extended-logging\@A3log\A3Log.ini`` into ``@A3log\`` on your server replacing the one already there

4. Get ``Desolation-extended-logging\@DesolationServer\Addons\DesoDB\Serialization\Players\fn_killPlayer.sqf`` and place on your server overwriting: (``@DesolationServer\Addons\DesoDB\Serialization\Players\fn_killPlayer.sqf``)

5. Youre good to go but feel free to edit the directory for the logs in the ``A3Log.in`` As is the get logged into ``@A3Log\logs\Kills``