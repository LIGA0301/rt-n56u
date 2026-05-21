<% nvram_get_x("", "wan_mac_x"); %>

<div class="box">
<table class="form">

<tr>
<th>WAN MAC</th>
<td>
<input type="text" id="wan_mac" maxlength="17"
value="<% nvram_get_x("", "wan_mac_x"); %>">

<input type="button"
class="btn"
value="随机"
onclick="randomMac('wan_mac')">
</td>
</tr>

<tr>
<th>LAN MAC</th>
<td>
<input type="text"
id="lan_mac"
maxlength="17"
value="<% nvram_get_x("", "lan_hwaddr"); %>">

<input type="button"
class="btn"
value="随机"
onclick="randomMac('lan_mac')">
</td>
</tr>

<tr>
<th>LAN IP</th>
<td>
<input type="text"
id="lan_ip"
value="<% nvram_get_x("", "lan_ipaddr"); %>">

<input type="button"
class="btn"
value="随机"
onclick="randomIP()">
</td>
</tr>

<tr>
<th>主机名</th>
<td>
<input type="text"
id="hostname"
value="<% nvram_get_x("", "computer_name"); %>">

<input type="button"
class="btn"
value="随机"
onclick="randomHostname()">
</td>
</tr>

</table>

<br>

<input type="button"
class="btn btn-primary"
value="应用设置"
onclick="saveConfig()">

</div>

<script>

function hex(){

return Math.floor(
Math.random()*256
).toString(16)
.padStart(2,'0')
.toUpperCase();

}

function randomMac(id){

var mac=[];

/*
固定本地MAC
第二位2
*/

mac[0]="02";

for(var i=1;i<6;i++){

mac.push(hex());

}

document.getElementById(id)
.value=mac.join(":");

}

function randomIP(){

var ip=
"192.168."
+
Math.floor(Math.random()*254+1)
+
".1";

document.getElementById("lan_ip")
.value=ip;

}

function randomHostname(){

var brands=[

"Xiaomi",
"Huawei",
"ASUS",
"ROG",
"Dell",
"Lenovo",
"MSI",
"Samsung",
"Intel",
"Acer"

];

var brand=
brands[
Math.floor(
Math.random()*brands.length
)];

var rand=
Math.random()
.toString(36)
.substr(2,6)
.toUpperCase();

document.getElementById(
"hostname"
).value=
brand+"-"+rand;

}

function saveConfig(){

form=document.createElement("form");

form.method="post";

form.action="/start_apply.htm";

function add(name,val){

var input=
document.createElement(
"input"
);

input.type="hidden";

input.name=name;

input.value=val;

form.appendChild(
input
);

}

add(
"wan_mac_x",
document.getElementById(
"wan_mac"
).value
);

add(
"lan_hwaddr",
document.getElementById(
"lan_mac"
).value
);

add(
"lan_ipaddr",
document.getElementById(
"lan_ip"
).value
);

add(
"computer_name",
document.getElementById(
"hostname"
).value
);

add(
"action_mode",
" Apply "
);

document.body.appendChild(
form
);

form.submit();

}

</script>
