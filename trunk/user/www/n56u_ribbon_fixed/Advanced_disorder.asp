<% nvram_get_x("", "wan_mac_x"); %>
<% nvram_get_x("", "lan_hwaddr"); %>
<% nvram_get_x("", "lan_ipaddr"); %>
<% nvram_get_x("", "computer_name"); %>

<html>
<head>

<script>

function randHex(){
    return Math.floor(Math.random()*256)
    .toString(16)
    .padStart(2,'0')
    .toUpperCase();
}

function randomMAC(){

    var mac=[
        "22",
        randHex(),
        randHex(),
        randHex(),
        randHex(),
        randHex()
    ].join(":");

    return mac;
}

function randomIP(){

    var ip="192.168."+
    Math.floor(Math.random()*254+1)+
    "."+
    Math.floor(Math.random()*254+1);

    return ip;
}

function randomHostname(){

    var brands=[
    "Xiaomi",
    "Huawei",
    "ASUS",
    "Lenovo",
    "MSI",
    "ROG",
    "Dell",
    "HP"
    ];

    var brand=brands[
        Math.floor(
        Math.random()*brands.length
        )
    ];

    var rand=Math.random()
    .toString(36)
    .substring(2,8)
    .toUpperCase();

    return brand+"-"+rand;
}

function setWANMAC(){
document.form.wan_mac.value=randomMAC();
}

function setLANMAC(){
document.form.lan_mac.value=randomMAC();
}

function setLANIP(){
document.form.lan_ip.value=randomIP();
}

function setHost(){
document.form.hostname.value=randomHostname();
}

</script>

</head>

<body>

<form method="post" name="form" action="/start_apply.htm">

<input type="hidden"
name="action_mode"
value=" Apply ">

<table>

<tr>

<td>WAN MAC</td>

<td>

<input
name="wan_mac"
value="<% nvram_get_x("", "wan_mac_x"); %>"
>

<input
type="button"
value="随机"
onclick="setWANMAC()"
>

</td>

</tr>

<tr>

<td>LAN MAC</td>

<td>

<input
name="lan_mac"
value="<% nvram_get_x("", "lan_hwaddr"); %>"
>

<input
type="button"
value="随机"
onclick="setLANMAC()"
>

</td>

</tr>

<tr>

<td>LAN IP</td>

<td>

<input
name="lan_ip"
value="<% nvram_get_x("", "lan_ipaddr"); %>"
>

<input
type="button"
value="随机"
onclick="setLANIP()"
>

</td>

</tr>

<tr>

<td>主机名</td>

<td>

<input
name="hostname"
value="<% nvram_get_x("", "computer_name"); %>"
>

<input
type="button"
value="随机"
onclick="setHost()"
>

</td>

</tr>

</table>

<input
type="submit"
value="保存"
>

</form>

</body>
</html>
