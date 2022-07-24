<script src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/js/jquery.flot.min.js"></script>
<script src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/js/jquery.flot.pie.min.js"></script>
<script src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/js/jquery.flot.time.min.js"></script>
<script src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/js/jquery.flot.stack.min.js"></script>
<script src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/js/jquery.flot.tooltip.min.js"></script>

<style>
    .AndrezzzMVPS {
        font-family: sans-serif;
        font-size: 14px;
    }

    .AndrezzzMVPS .fade:not(.show) {
        display: none;
    }

    .AndrezzzMVPS #loading {
        position:fixed;
        color: #65686a;
        display:none;
        z-index:1000000;
    }

    .AndrezzzMVPS #loading-spinner {
        position:fixed;
        overflow: visible;
        margin: auto;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
    }

    .AndrezzzMVPS #loading:before {
        content: '';
        display: block;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.3);
    }

    .AndrezzzMVPS a {
        cursor: pointer;
    }
    .AndrezzzMVPS img {
        border-style: none;
        margin-bottom: 10px;
        vertical-align: middle;
    }

    .AndrezzzMVPS img .flag {
        border: 1px solid #ddd;
    }

    .AndrezzzMVPS .information {
        left: 0;
        right: 0;
        bottom: 0;
        color: #343a40;
        position: absolute;
    }

    .AndrezzzMVPS .form-label {
        color: #868888;
        margin-bottom: 0px;
        word-break: break-all;
    }

    .AndrezzzMVPS .border {
        display: flex;
        min-height: 125px;
        position: relative;
        align-items: center;
        justify-content: center;
    }

    .AndrezzzMVPS .mb-3, .AndrezzzMVPS .my-3 {
        margin-bottom: 1rem!important;
    }

    .AndrezzzMVPS .without-mb {
        margin-bottom: 0rem!important;
    }

    .AndrezzzMVPS .p-2 {
        padding: .5rem!important;
    }

    .AndrezzzMVPS i.fa.fa-play.start {
        color: #06d79c;
        font-size: 30px;
    }

    .AndrezzzMVPS i.fa.fa-stop.stop {
        color: #656373;
        font-size: 30px;
    }

    .AndrezzzMVPS i.fa.fa-sync.reboot {
        color: #398bf7;
        font-size: 30px;
    }

    .AndrezzzMVPS .dashboard-title {
        color: #3d3d3d;
        font-size: 22px;
    }

    .AndrezzzMVPS .dashboard-value {
        color: #586271 !important;
    }

    .AndrezzzMVPS .usage-details {
        border: 1px solid #e7e4e4;
        transition: all ease-in .2s;
    }

    .AndrezzzMVPS .usage-details:hover {
        border:1px solid transparent;
        box-shadow: 1px 1px 8px 6px #e5e3e3bf;
    }

    .AndrezzzMVPS .overview-label {
        color: #99abb4;
    }

    .AndrezzzMVPS .progress.disk-bar {
        height: 14px;
        margin-top: 25px;
        margin-bottom: 20px;
        border-radius: 6px;
        -webkit-box-shadow: none;
        box-shadow: none;
    }

    .AndrezzzMVPS .used_disk_percent, .used-cpu {
        color: #1e88e5;
        font-size: 20px;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs {
        border-bottom: 1px solid #dfd8d8;
        margin: 0;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs .nav-item {
        border-bottom: 1px solid #dfd8d8;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs li a {
        position: relative;
        padding: 5px;
        margin-right: 10px;
        color: #374045 !important;
        border: none;
        border-radius: 0;
        background: transparent;
        transition: all 0.3s ease 0s;
        z-index: 2;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs li a:before {
        content: "";
        width: 100%;
        height: 4px;
        border-radius: 2px;
        position: absolute;
        bottom: 0;
        left: 0;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs li a:after {
        content: "";
        width: 0;
        height: 4px;
        background: linear-gradient(to right, #396afc, #2948ff);
        border-bottom: 1px solid #727cb6;
        border-radius: 2px;
        position: absolute;
        bottom: -2px;
        left: 0;
        transition: all .4s ease 0s;
        z-index: 1;
    }

    .AndrezzzMVPS .dashboard-tab .nav-tabs li a.active:after {
        width: 100%;
        opacity: 1;
    }

    .AndrezzzMVPS .vertical-tabs .nav-link {
        color: #515a68;
        padding: 7px 5px;
        margin-bottom: 10px;
        transition: all ease-in 0.2s;
        text-align: left!important;
    }

    .AndrezzzMVPS .vertical-tabs .nav-link.active {
        border-radius: 0px;
        color: #2948ff;
    }

    .AndrezzzMVPS .v-tabs-container{
        border-right: 1px solid #dfd8d8;
    }

    .AndrezzzMVPS .nav-pills .nav-link.active {
        background-color: unset;
    }

    .AndrezzzMVPS .custom-control-input:checked~.custom-control-label::before {
        color: #fff;
        border-color: #007bff;
        background-color: #007bff;
    }

    .AndrezzzMVPS .info-text {
        color: #398bf7;
        cursor: pointer;
    }

    .AndrezzzMVPS #graphs-tab .nav-link, .AndrezzzMVPS #sub-tasks-and-logs .nav-link {
        color: #576170;
        transition: all 0.4s linear;
    }

    .AndrezzzMVPS #graphs-tab .nav-link.active, .AndrezzzMVPS #sub-tasks-and-logs .nav-link.active {
        border-radius: 0px;
        color: #ffffff;
        background: linear-gradient(to right, #396afc, #2948ff);
    }

    .AndrezzzMVPS .prev-mnth.green_but, .AndrezzzMVPS .next-mnth.green_but {
        padding: 4px 10px;
    }

    .AndrezzzMVPS .graphs img {
        width: 100%;
    }

    .AndrezzzMVPS .submit-btn {
        background-color: #398bf7;
        border:none;
        border-radius: 4px;
        color: #ffffff;
        font-weight: 500;
        padding: 7px 12px;
        transition: 0.2s ease-in;
    }

    .AndrezzzMVPS .cancel-btn {
        background-color: #5a6268;
        border:none;
        border-radius: 4px;
        color: #ffffff;
        font-weight: 500;
        padding: 7px 12px;
        transition: 0.2s ease-in;
    }

    .AndrezzzMVPS .submit-btn:hover {
        color: #ffffff !important;
        box-shadow:0 14px 26px -12px #1769ff6b, 0 4px 23px 0 #0000001f, 0 8px 10px -5px #1769ff33;
    }

    .AndrezzzMVPS .cancel-btn:hover {
        color: #ffffff !important;
        box-shadow:0 14px 26px -12px #000000, 0 4px 23px 0 #0000001f, 0 8px 10px -5px #07183533;
    }

    .AndrezzzMVPS .modal-title {
        font-weight: 400;
        color: #455a64;
    }

    .AndrezzzMVPS .modal-title i.success {
        font-size: 40px;
        color: #06d79c;
        vertical-align: middle;
    }

    .AndrezzzMVPS .modal-title i.warning {
        font-size: 40px;
        color: orange;
        vertical-align: middle;
    }

    .AndrezzzMVPS .modal-title i.error {
        font-size: 40px;
        color: #ef5350;
        vertical-align: middle;
    }

    .AndrezzzMVPS .modal-body {
        color: #868888;
        font-weight: 500;
        line-height: 30px;
        margin-bottom: 0px;
    }

    .AndrezzzMVPS .modal-body p {
        margin-bottom: 0px;
    }

    .AndrezzzMVPS .link-btn {
        background-color: #398bf7;
        border:none;
        border-radius: 4px;
        text-decoration: none !important;
        color: #ffffff !important;
        font-size: 14px;
        padding: 7px 12px;
        transition: 0.2s ease-in;
    }

    .AndrezzzMVPS .link-btn:hover {
        text-decoration: none;
        color: #ffffff;
        box-shadow: 0 14px 26px -12px rgba(23, 105, 255, 0.42), 0 4px 23px 0 rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(23, 105, 255, 0.2);
    }

    .AndrezzzMVPS .v-tab-heading {
        color: #515557;
        font-size: 18px;
    }

    .AndrezzzMVPS .distro_name.media-heading {
        color: #3d3d3d;
        font-size: 22px;
    }

    .AndrezzzMVPS .version {
        color: #586271;
        font-size: 16px;
    }

    .AndrezzzMVPS .info-icon {
        background-color: #007bff;
        color: #fff;
        padding: 4px 12px;
        border: none;
        border-radius: 4px;
    }

    .AndrezzzMVPS .info-icon:hover,
    .AndrezzzMVPS .info-icon:focus {
        border:none;
        box-shadow: 0 14px 26px -12px rgba(23, 105, 255, 0.42), 0 4px 23px 0 rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(23, 105, 255, 0.2);
    }

    .AndrezzzMVPS .info-icon i {
        font-size: 12px;
    }

    .AndrezzzMVPS .os_badge {
        border: 1px solid #ccc;
        cursor: pointer;
        transition: height 0.5s;
        border-radius: 3px;
        position: relative;
    }

    .AndrezzzMVPS #os_list .dropdown-menu{
        max-height: 200px;
        overflow-y: auto;
    }

    .AndrezzzMVPS .os_badge_list a{
        color: #576170;
        text-decoration: none;
        outline: none;
        display:block;
        padding:8px;
        background-color: #fff;
    }

    .AndrezzzMVPS .os_badge_list a:hover {
        color: #2f3235;
        background-color: #f9f6f6;
    }

    .AndrezzzMVPS .os_badge_list .SelectedOS{ 
        color: #ffffff;
        background-color: #2196F3;
    }

    .AndrezzzMVPS .os_badge.selected .version,
    .AndrezzzMVPS .os_badge.selected .distro_name.media-heading, .os_badge.selected i{
        color: #ffffff;
    }
        
    .AndrezzzMVPS .os_badge.selected {
        color: #fff;
        background-color: #06d79c;
    }

    .AndrezzzMVPS .os_badge i {
        position: absolute;
        top: 26px;
        right: 16px;
        color: #aaa;
    }

    .AndrezzzMVPS .os_badge .media-left {
        padding: 8px;
    }

    .AndrezzzMVPS .os_badge .media-body {
        vertical-align: middle;
        padding: 8px;
    }

    .AndrezzzMVPS .os_badge .version {
        color: #888;
    }

    .AndrezzzMVPS .os_badge.expanded {
        position: relative;
        z-index: 999;
    }

    .AndrezzzMVPS .os_badge .dropdown-toggle::after{
        content: none;
    }

    .AndrezzzMVPS .tab-content>.tab-pane {
        display: none;
    }
 
    .AndrezzzMVPS .tab-content>.active {
        display: block;
    }

    .AndrezzzMVPS .head {
        margin-bottom: 10px;
    }

    .AndrezzzMVPS .head>img {
        width: 32px;
    }

    .AndrezzzMVPS .restore-icon {
        font-size: 17px;
    }

    .AndrezzzMVPS .create {
        color: #06d79c;
    }

    .AndrezzzMVPS .delete {
        color: #ff0000;
    }

    .AndrezzzMVPS .table.dataTable.no-footer {
        border-bottom: 1px solid #5d5b63 !important;
    }

    .AndrezzzMVPS table.tablesorter {
        box-shadow: 0 2px 12px -3px rgba(0,0,0,0.5);
    }

    .AndrezzzMVPS table.dataTable {
        clear: both;
        margin-top: 6px !important;
        margin-bottom: 6px !important;
        max-width: none !important;
        border-collapse: separate !important;
        border-spacing: 0;
    }

    #firewallTable th, #backupTable th {
        color: #ffffff;
        background-color: #36304a !important;
        border: unset !important;
        font-weight: unset !important;
        position: sticky !important;
        top: -1px;
        z-index: 99;
    }

    .AndrezzzMVPS .fa-1x{
        font-size: 20px !important;
    }

    .AndrezzzMVPS .gray-txt {
        color: #666;
    }
</style>

<script>
    function $_(id) {
        return document.getElementById(id);
    }

    function AndrezzzMVPS_API(action, alert = true, json = {}) {
        AndrezzzMVPS_Loading(true);
        
        WHMCS.http.jqClient.post('clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=ClientAreaAPI&api=' + action, json,
            function(data) {
                if (data.result === 'success') {
                    switch (action) {
                        case 'IPv6':
                            data.data = 'IPv6 created: ' + data.data;
                            break;

                        case 'Graphs':
                            $_('cpu-graph').innerHTML = data.cpu_img;
                            $_('cpu-graph').classList.add('graphs');

                            $_('ram-graph').innerHTML = data.mem_img;
                            $_('ram-graph').classList.add('graphs');

                            $_('disk-graph').innerHTML = data.disk_img;
                            $_('disk-graph').classList.add('graphs');
                            
                            $_('network-graph').innerHTML = data.net_img;
                            $_('network-graph').classList.add('graphs');
                            
                            break;

						case 'Reinstall':
                            window.location.reload();
							break;

                        case 'List backups':
                            const backupTable = $_('backupTable').getElementsByTagName('tbody')[0];
                            
                            delete data.result;
                            $('#backupTable tbody').find('tr').remove();

                            for (let i = 0; i < Object.keys(data).length; i++) {
                                const backup = data[Object.keys(data)[i]];
                                
                                const row = backupTable.insertRow();
                                const date = row.insertCell(0);
                                const size = row.insertCell(1);
                                const type = row.insertCell(2);
                                const status = row.insertCell(3);
                                const actions = row.insertCell(4);
                                
                                date.innerHTML = new Date(backup.date).toLocaleString();
                                size.innerHTML = (backup.size !== '' ? backup.size : '0.00GB');
                                type.innerHTML = backup.type;

                                if (backup.status === 'ok') {
                                    status.innerHTML = '<div class="badge badge-success">Completed</div>';
                                    actions.innerHTML = '<a href="#" onclick="AndrezzzMVPS_API(\'Restore backup\', true, { backup: ' + backup.id + ' });return false;"><i class="fas fa-history restore-icon text-secondary mr-2"></i></a><a href="#" onclick="AndrezzzMVPS_API(\'Delete backup\', true, { backup: ' + backup.id + ' });return false;"><i class="fa fa-1x fa-times delete" aria-hidden="true"></i></a>';
                                } else if (backup.status === 'preparing') {
                                    status.innerHTML = '<div class="badge badge-info">Preparing</div>';
                                } else if (backup.status === 'creating') {
                                    status.innerHTML = '<div class="badge badge-warning">Creating ' + backup.percentage + '%</div>';
                                } else {
                                    status.innerHTML = '<div class="badge badge-danger">' + backup.status + '</div>';
                                }
                            }

                            break;

                        case 'Create backup':
                            AndrezzzMVPS_API('List backups', false);
                            break;

                        case 'Delete backup':
                            AndrezzzMVPS_API('List backups', false);
                            break;

                        case 'Get Firewall rules':
                            const firewallTable = $_('firewallTable').getElementsByTagName('tbody')[0];
                            
                            delete data.result;
                            $('#firewallTable tbody').find('tr:not(:first)').remove();

                            for (let i = 0; i < Object.keys(data).length; i++) {
                                const rule = data[Object.keys(data)[i]];
                                
                                const row = firewallTable.insertRow();
                                const action = row.insertCell(0);
                                const port = row.insertCell(1);
                                const protocol = row.insertCell(2);
                                const source = row.insertCell(3);
                                const note = row.insertCell(4);
                                const actions = row.insertCell(5);

                                action.innerHTML = rule.action;
                                port.innerHTML = rule.port;
                                protocol.innerHTML = rule.protocol;
                                source.innerHTML = rule.source;
                                note.innerHTML = rule.note;
                                actions.innerHTML = '<a href="#" onclick="AndrezzzMVPS_API(\'Delete Firewall rule\', true, { rule_id: ' + rule.id + ' });return false;"><i class="fa fa-1x fa-times delete" aria-hidden="true"></i></a>';
                            }

                            break;

                        case 'Add Firewall rules':
                            AndrezzzMVPS_API('Get Firewall rules', false);
                            break;

                        case 'Delete Firewall rule':
                            AndrezzzMVPS_API('Get Firewall rules', false);
                            break;

                        case 'Commit Firewall rules':
                            AndrezzzMVPS_API('Get Firewall rules', false);
                            break;
                    }

                    AndrezzzMVPS_Loading(false);
                    
                    if (alert) {
                        if (typeof data.data === 'string') {
                            $('#AndrezzzMVPS-AlertSuccessMsg').html(data.data);
                        } else {
                            $('#AndrezzzMVPS-AlertSuccessMsg').html('{$LANG.moduleactionsuccess}');
                        }

                        $('#AndrezzzMVPS-AlertSuccess').hide().removeClass('hidden').slideDown();

                    	setTimeout(function() {
							$('#AndrezzzMVPS-AlertSuccess').slideUp();
						}, 5000);
                    }
                } else {
                    AndrezzzMVPS_Loading(false);
                    
                    $('#AndrezzzMVPS-AlertFailedMsg').html(data.message);
                    $('#AndrezzzMVPS-AlertFailed').hide().removeClass('hidden').slideDown();

                    setTimeout(function() {
                        $('#AndrezzzMVPS-AlertFailed').slideUp();
                    }, 5000);
                }
            }
        );
    }

    function AndrezzzMVPS_VNC() {
        window.open('{$WEB_ROOT}/clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=VNC', '_blank', 'toolbar=0,location=0,menubar=0');
    }

    function AndrezzzMVPS_ShowTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css({
            position: 'absolute',
            display: 'none',
            top: y + 20,
            left: x - 20,
            border: '1px solid #CCCCCC',
            padding: '2px',
            'background-color': '#EFEFEF',
            'z-index': 10000,
            opacity: 0.80
        }).appendTo('body').fadeIn(200);
    }

    function AndrezzzMVPS_MakeData(data) {
        var now = new Date().getTime();
        var updateInterval = 1000;

        i = 0;
        var fdata = [];

        for (x in data) {
            fdata.push([now += updateInterval, data[x]]);
            i++;
        }

        return fdata;
    }

    function AndrezzzMVPS_Loading(status) {
        $_('loading').style.left = ((document.body.clientWidth - $('#loading').width()) / 2).toString() + 'px';

        if (status) {
            $('#loading').show();
        } else {
            $('#loading').hide();
        }
    }
    
    function AndrezzzMVPS_LiveResourceGraph(id, data, options, showIn, showTime) {
        var plot = $.plot($('#' + id), data, options);

        if (!('tooltip' in options)) {
            var previousPoint = null;

            $('#' + id).bind('plothover', function(event, pos, item) {
                $('#x').text(pos.x.toFixed(2));
                $('#y').text(pos.y.toFixed(2));

                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;
                        $('#tooltip').remove();

                        var x = item.datapoint[0].toFixed(2);
                        var y = item.datapoint[1].toFixed(2);
                        var time = '';

                        if (showTime) {
                            time = nDate(x, 'm/d H:i:s');
                        }

                        if (id === 'ntw_plot' || id === 'io_read_plot' || id === 'io_write_plot') {
                            var yval = parseInt(y);
                            var show_ntw_in;

                            if (yval <= 1024) {
                                show_ntw_in = 'B/s';
                            } else if (yval > 1024 && yval <= (1024 * 1024)) {
                                yval = (yval / 1024).toFixed(2);
                                show_ntw_in = 'KB/s';
                            } else if (yval > (1024 * 1024) && yval <= (1024 * 1024 * 1024)) {
                                yval = (yval / 1024 / 1024).toFixed(2);
                                show_ntw_in = 'MB/s';
                            } else if (yval > (1024 * 1024 * 1024)) {
                                yval = (yval / 1024 / 1024 / 1024).toFixed(2);
                                show_ntw_in = 'GB/s';
                            }

                            AndrezzzMVPS_ShowTooltip(item.pageX, item.pageY, item.series.label + ' ' + yval + ' ' + show_ntw_in + '&nbsp; at &nbsp;' + time);
                        } else {
                            AndrezzzMVPS_ShowTooltip(item.pageX, item.pageY, parseFloat(y) + ' ' + showIn + time);
                        }

                    }
                } else {
                    $('#tooltip').remove();
                    previousPoint = null;
                }
            });
        }
    }

    $(document).ready(function () {
        var cpuOptions = {
            series: {
                lines: {
                    show: true,
                    lineWidth: 0.1,
                    fill: true
                }
            },
            xaxis: {
                show: true,
                color: 'white',
                mode: 'time',
                tickSize: [1, 'second'],
                tickFormatter: function(v, axis) {
                    var date = new Date(v);

                    if (date.getSeconds() % 5 == 0) {
                        var hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours();
                        var minutes = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes();
                        var seconds = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();

                        return hours + ':' + minutes + ':' + seconds;
                    } else {
                        return '';
                    }
                },
                axisLabel: ' ',
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 10
            },
            yaxis: {
                show: false
            },
            grid: {
                borderWidth: 0,
                borderColor: '#fff',
                hoverable: true,
            },
        };

        var cpudata = [];
        var totalPoints = 30;

        for (var i = 0; i < totalPoints; ++i) {
            cpudata.push(0.1);
        }

        var cpuDataset = [
            { label: '', data: AndrezzzMVPS_MakeData(cpudata), color: '#e51e88' }
        ];

        var timerServerLoads;
        AndrezzzMVPS_LiveResourceGraph('cpuHistory', cpuDataset, cpuOptions, '%', false);

		function AndrezzzMVPS_updateStatitics() {
            const serverInfoInitial = JSON.parse('{$serverInfo|@json_encode}');
			clearTimeout(timerServerLoads);

            if (timerServerLoads) {
                WHMCS.http.jqClient.post('clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=ClientAreaAPI&api=Server%20Info',
                    function(serverInfo) {
                        if (serverInfo.result === 'success') {
                            serverInfo.ram_usage = serverInfo.ram_usage / (1000 * 1000 * 1000);
                            serverInfo.ram_usage_view = serverInfo.ram_usage.toFixed(2);
                            serverInfo.ram_percentage = ((serverInfo.ram_usage * 100) / serverInfoInitial.package.ram).toFixed();
                            serverInfo.bandwidth_percentage = ((serverInfo.bandwidth_usage * 100) / (serverInfoInitial.package.bandwidth * 1000)).toFixed();

                            $('#ramPercentBar').css('background', (serverInfo.ram_percentage <= 40 ? '#06d79c' : serverInfo.ram_percentage < 80 ? 'orange' :  serverInfo.ram_percentage >= 80 ? 'red' : '#ff0000'));
                            $('#ramPercentBar').css('width', serverInfo.ram_percentage + '%');
                            $('#ramPercentBar').html(serverInfo.ram_percentage + ' %');
                            $('#ramPercentBar').attr('tooltip', serverInfo.ram_percentage + ' %');
                            $('#ramPercentVal').html(serverInfo.ram_usage_view + ' / ' + serverInfoInitial.package.ram + ' GB');

                            $('#bandwidthPercentBar').css('background', (serverInfo.bandwidth_percentage <= 40 ? '#9c06d7' : serverInfo.bandwidth_percentage < 80 ? 'orange' :  serverInfo.bandwidth_percentage >= 80 ? 'red' : '#ff0000'));
                            $('#bandwidthPercentBar').css('width', serverInfo.bandwidth_percentage + '%');
                            $('#bandwidthPercentBar').html(serverInfo.bandwidth_percentage + ' %');
                            $('#bandwidthPercentBar').attr('tooltip', serverInfo.bandwidth_percentage + ' %');
                            $('#bandwidthPercentVal').html(serverInfo.bandwidth_usage + ' / ' + serverInfoInitial.package.bandwidth * 1000 + ' GB');

                            serverInfo.cpu_usage = serverInfo.cpu_usage * 100;
                            
                            cpudata.shift();
                            cpudata.push(parseFloat(serverInfo.cpu_usage));

                            cpuDataset = [
                                { label: '', data: AndrezzzMVPS_MakeData(cpudata), color: '#3498DB' }
                            ];

                            AndrezzzMVPS_LiveResourceGraph('cpuHistory', cpuDataset, cpuOptions, '%', false);

                            $('.used-cpu').html(serverInfo.cpu_usage + '%');
                        } else {
                            $('#AndrezzzMVPS-AlertFailedMsg').html(serverInfo.message);
                            $('#AndrezzzMVPS-AlertFailed').hide().removeClass('hidden').slideDown();
                        }
                    }
                );
            } else {
                const serverInfo = serverInfoInitial;

                serverInfo.ram_usage = serverInfo.ram_usage / (1000 * 1000 * 1000);
                serverInfo.ram_usage_view = serverInfo.ram_usage.toFixed(2);
                serverInfo.ram_percentage = ((serverInfo.ram_usage * 100) / serverInfoInitial.package.ram).toFixed();
                serverInfo.bandwidth_percentage = ((serverInfo.bandwidth_usage * 100) / (serverInfoInitial.package.bandwidth * 1000)).toFixed();

                $('#ramPercentBar').css('background', (serverInfo.ram_percentage <= 40 ? '#06d79c' : serverInfo.ram_percentage < 80 ? 'orange' :  serverInfo.ram_percentage >= 80 ? 'red' : '#ff0000'));
                $('#ramPercentBar').css('width', serverInfo.ram_percentage + '%');
                $('#ramPercentBar').html(serverInfo.ram_percentage + ' %');
                $('#ramPercentBar').attr('tooltip', serverInfo.ram_percentage + ' %');
                $('#ramPercentVal').html(serverInfo.ram_usage_view + ' / ' + serverInfoInitial.package.ram + ' GB');

                $('#bandwidthPercentBar').css('background', (serverInfo.bandwidth_percentage <= 40 ? '#9c06d7' : serverInfo.bandwidth_percentage < 80 ? 'orange' :  serverInfo.bandwidth_percentage >= 80 ? 'red' : '#ff0000'));
                $('#bandwidthPercentBar').css('width', serverInfo.bandwidth_percentage + '%');
                $('#bandwidthPercentBar').html(serverInfo.bandwidth_percentage + ' %');
                $('#bandwidthPercentBar').attr('tooltip', serverInfo.bandwidth_percentage + ' %');
                $('#bandwidthPercentVal').html(serverInfo.bandwidth_usage + ' / ' + serverInfoInitial.package.bandwidth * 1000 + ' GB');

                cpudata.shift();
                cpudata.push(parseFloat(serverInfo.cpu_usage));

                cpuDataset = [
                    { label: '', data: AndrezzzMVPS_MakeData(cpudata), color: '#3498DB' }
                ];

                AndrezzzMVPS_LiveResourceGraph('cpuHistory', cpuDataset, cpuOptions, '%', false);

                $('.used-cpu').html(serverInfo.cpu_usage + '%');
            }

            timerServerLoads = setTimeout(AndrezzzMVPS_updateStatitics, 10000);
		}

		AndrezzzMVPS_updateStatitics();
    });

	function AndrezzzMVPS_ChooseOS(button) {
		var newOS = $_('newOS').value;

		if (newOS !== '0') {
			newOS = $('[data-os="' + newOS + '"]')[0];

			newOS.classList.remove('SelectedOS');
			$_(newOS.dataset.group + '-os').classList.remove('selected');
			$_(newOS.dataset.group + '-version').innerText = 'SELECT VERSION';
		}

		$_('newOS').value = button.dataset.os;

		button.classList.add('SelectedOS');
		$_(button.dataset.group + '-os').classList.add('selected');
		$_(button.dataset.group + '-version').innerText = button.innerText;
	}
</script>

<div class="AndrezzzMVPS" style="display: block">
    <div id="loading" class="font-weight-bold" style="display: none;">
        <span class="spinner-border spinner-border-sm" style="width: 3rem; height: 3rem;" id="loading-spinner" role="status" aria-hidden="true"></span>
    </div>

    {include file="$template/includes/alert.tpl" type="success" msg='<span id="AndrezzzMVPS-AlertSuccessMsg"></span>' textcenter=true hide=true idname="AndrezzzMVPS-AlertSuccess"}
    {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.moduleactionfailed|cat:': <span id="AndrezzzMVPS-AlertFailedMsg"></span>' textcenter=true hide=true idname="AndrezzzMVPS-AlertFailed"}

    <div class="title-block text-center dashboard-title mb-3">VPS Information</div>

    <div class="row mb-3">
        <div class="col-md-6 mb-3 text-center">
            <div class="border p-2">
                <div class="mb-2">
                    <span><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/os/{$serverInfo['operatingSystem']['image']}.png" width="64px" height="64px" alt="{$serverInfo['operatingSystem']['name']}"/></span>
                </div>
                <div class="information">
                    <span class="form-label dashboard-value d-inline-block mb-2">{$serverInfo['operatingSystem']['name']}</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3 text-center">
            <div class="border p-2">
                <div class="mb-3">
                    <span><img class="flag" src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/flags/{$serverInfo['location']['img']}.png" height="70px"/></span>
                </div>
                <div class="information">
                    <span class="form-label dashboard-value d-inline-block mb-2">{$serverInfo['location']['name']}</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3 text-center">
            <div class="border p-2">
                <div class="mb-2">
                    <span><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/{$serverInfo['status']}.png" height="64px"/></span>
                </div>
                <div class="information">
                    <span class="form-label dashboard-value d-inline-block mb-2">{$serverInfo['statusDescription']}</span>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="border p-2">
                <div class="row w-100">
                    <div class="col-4 without-mb text-center" tooltip="{if $serverInfo['status'] !== 'running'}Start the VPS{else}Stop the VPS{/if}" data-original-title="" title="">
                        <a onclick="AndrezzzMVPS_API('{if $serverInfo['status'] !== 'running'}Start{else}Stop{/if}');"><i class="fa fa-{if $serverInfo['status'] !== 'running'}play start{else}stop stop{/if} mr-2" aria-hidden="true"></i></a>
                    </div>
                    <div class="col-4 without-mb text-center" tooltip="Reboot the VPS" data-original-title="" title="">
                        <a onclick="AndrezzzMVPS_API('Reboot');"><i class="fa fa-sync reboot mr-2" aria-hidden="true"></i></a>
                    </div>
                    <div class="col-4 without-mb text-center" tooltip="Connect to the VPS via VNC" data-original-title="" title="">
                        <a onclick="AndrezzzMVPS_VNC();"><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/vnc.png" height="30px"/></a>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label d-inline-block">Uptime:</label>
                        <span class="form-label dashboard-value d-inline-block mr-2">{$serverInfo['uptime_text']}</span>
                        <br />
                        <label class="form-label d-inline-block">IPv4:</label>
                        <span class="form-label dashboard-value d-inline-block mr-2">{$serverInfo['ips'][0]}</span>
                        <br />
                        <label class="form-label d-inline-block">IPv6:</label>
                        <span class="form-label dashboard-value d-inline-block mr-2">{if $serverInfo['ipv6'] !== ''}{$serverInfo['ipv6']}{else}<a onclick="AndrezzzMVPS_API('IPv6');">Create</a>{/if}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="dashboard-tab" id="dashboard">
        <ul class="nav nav-tabs mb-4 dash-tabs" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="overview-tab" data-toggle="pill" href="#overview" role="tab" aria-controls="overview" aria-selected="false">Overview</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="graphs-tab" data-toggle="pill" href="#graphs" onclick="AndrezzzMVPS_API('Graphs', false, { time: 'hour' });" role="tab" aria-controls="graphs" aria-selected="false">Graphs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="settings-tab" data-toggle="pill" href="#settings" role="tab" aria-controls="settings" aria-selected="false">Settings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="backups-tab" data-toggle="pill" href="#backups" onclick="AndrezzzMVPS_API('List backups', false);" role="tab" aria-controls="backups" aria-selected="false">Backups</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="rdns-tab" data-toggle="pill" href="#rdns" role="tab" aria-controls="rdns" aria-selected="false">Reverse DNS</a>
            </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                <div class="head">
                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/eye.png">
                    <span class="h3">Overview</span>
                </div>

                <div class="row mb-2">
                    <div class="col-md-6 mb-3">
                        <div class="usage-details px-3 py-4">
                            <p class="overview-label">RAM Usage</p>
                            <div class="progress disk-bar">
                                <div id="ramPercentBar" aria-valuemin="0" aria-valuemax="100" role="progressbar" class="progress-bar prog-organge" data-placement="right" tooltip="0% Used" style="background: #06d79c; width: 0%">0%</div>
                            </div>
                            <span id="ramPercentVal" class="used_disk_percent mr-1">0 / 0 GB</span>
                            <span class="overview-label">Used</span>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="usage-details px-3 py-4">
                            <p class="overview-label">Bandwidth Usage</p>
                            <div class="progress disk-bar">
                                <div id="bandwidthPercentBar" aria-valuemin="0" aria-valuemax="100" role="progressbar" class="progress-bar prog-organge" data-placement="right" tooltip="0% Used" style="background: #9c06d7; width: 0%">0%</div>
                            </div>
                            <span id="bandwidthPercentVal" class="used_disk_percent mr-1">0 / 0 TB</span>
                            <span class="overview-label">Used</span>
                        </div>
                    </div>
                    <div class="col-md-12 mb-6">
                        <div class="usage-details px-3 py-2">
                            <div class="row">
                                <div class="col-12 col-xl-3 py-3">
                                    <p class="overview-label">CPU Usage</p>
                                    <p class="overview-label"><span class="used-cpu">{$serverInfo['cpu_usage']}%</span></p>
                                </div>
                                <div class="col-12 col-xl-9 overflow-hidden">
                                    <div id="cpuHistory" class="w-100 display" style="height:150px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="graphs" role="tabpanel" aria-labelledby="graphs-tab">
                <div class="head">
                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/search.png">
                    <span class="h3">Graphs</span>
                </div>

                <div class="panel bw_div">
                    <div id="bw_div">
                        <div class="text-center">
                            <ul class="nav nav-pills mb-3 d-inline-flex" id="graphs-tab" role="tablist">
                                <li class="nav-item mx-2">
                                    <a class="nav-link active" id="cpu-tab" data-toggle="pill" href="#cpu" role="tab" aria-controls="cpu" aria-selected="true">CPU</a>
                                </li>
                                <li class="nav-item mx-2">
                                    <a class="nav-link" id="ram-tab" data-toggle="pill" href="#ram" role="tab" aria-controls="ram" aria-selected="false" style="display: block">RAM</a>
                                </li>
                                <li class="nav-item mx-2">
                                    <a class="nav-link" id="disk-tab" data-toggle="pill" href="#disk" role="tab" aria-controls="disk" aria-selected="false" style="display: block">Disk</a>
                                </li>
                                <li class="nav-item mx-2">
                                    <a class="nav-link" id="network-tab" data-toggle="pill" href="#network" role="tab" aria-controls="network" aria-selected="false" style="display: block">Network</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="cpu" role="tabpanel" aria-labelledby="cpu-tab">
                                <span id="cpu-graph"><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/loading.png"/></span>
                            </div>
                            <div class="tab-pane fade" id="ram" role="tabpanel" aria-labelledby="ram-tab">
                                <span id="ram-graph"><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/loading.png"/></span>
                            </div>
                            <div class="tab-pane fade" id="disk" role="tabpanel" aria-labelledby="disk-tab">
                                <span id="disk-graph"><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/loading.png"/></span>
                            </div>
                            <div class="tab-pane fade" id="network" role="tabpanel" aria-labelledby="network-tab">
                                <span id="network-graph"><img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/loading.png"/></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                <div class="row vertical-tabs">
                    <div class="col-md-3 v-tabs-container" style="max-width: 15%!important;">
                        <div class="nav flex-md-column mx-auto left-side-tabs mb-4 mb-md-0" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link mr-2 mr-md-0 active" id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false" style="display: block">Password</a>
                            <a class="nav-link mr-2 mr-md-0" id="reinstall-tab" data-toggle="pill" href="#reinstall" role="tab" aria-controls="reinstall" aria-selected="false" style="display: block">Reinstall</a>
                            <a class="nav-link mr-2 mr-md-0" id="firewall-tab" data-toggle="pill" href="#firewall" onclick="AndrezzzMVPS_API('Get Firewall rules', false);" role="tab" aria-controls="firewall" aria-selected="false" style="display: block">Firewall</a>
                        </div>
                    </div>
					<div class="col-md-10">
                        <div class="tab-content vertical-tab-content">
                            <div class="tab-pane fade active show" id="password" role="tabpanel" aria-labelledby="password-tab">
                                <div class="head">
                                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/settings.png">
                                    <span class="h3">Password</span>
                                </div>

                                <div class="badge badge-warning mb-3">The installation password is removed from our systems after 72 hours. It is mandatory for you to change the password on your first login!</div>
                                
                                <label class="form-label d-inline-block">Password:</label>
                                <span class="form-label dashboard-value d-inline-block mr-2">{if $serverInfo['root'] != ''}{$serverInfo['root']}{else}Expired{/if}</span>
                                <br/>
                                <br/>
                                <button onclick="AndrezzzMVPS_API('Reset root');" class="submit-btn">Reset Password</button>
                            </div>
                            <div class="tab-pane fade" id="reinstall" role="tabpanel" aria-labelledby="reinstall-tab">
                                <div class="head">
                                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/settings.png">
                                    <span class="h3">Reinstall</span>
                                </div>

                                <div class="badge badge-danger mb-3">Please understand that by reinstalling, all the data will be wiped from the server.</div>

                                <div id="reinstallIntructions" class="col-lg-10 col-12 mx-auto">
                                    <label class="form-label">Select OS:</label>
                                    
                                    <div id="os_list" class="row mb-4">
                                        {foreach from=$operatingSystems key=$group item=$operatingSystemsGroup}
                                        <div id="{$group}-os" class="col os_badge media dropdown show">
                                            <button class="btn dropdown-toggle border-0 w-100 p-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <div class="media-left p-1 float-left">
                                                    <img class="distro_img media-object" src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/os/{$operatingSystemsGroup['image']}.png">
                                                </div>
                                                <div class="media-body float-left text-left p-2">
                                                    <h4 class="distro_name media-heading">{$operatingSystemsGroup['name']}</h4>
                                                    <span id="{$group}-version" class="version">SELECT VERSION</span>
                                                </div>
                                            </button>
                                            <div class="os_badge_list dropdown-menu w-100" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 68px, 0px); top: 0px; left: 0px; will-change: transform;">
                                                {foreach from=$operatingSystemsGroup['versions'] item=$operatingSystem}
                                                <a href="#" data-os="{$operatingSystem['id']}" data-group="{$group}" onclick="AndrezzzMVPS_ChooseOS(this);return false;">{$operatingSystem['name']}</a>
                                                {/foreach}
                                            </div>
                                        </div>
                                        {/foreach}
                                    </div>

                                    <input type="hidden" id="newOS" value="0"/>				
                                    <button onclick="AndrezzzMVPS_API('Reinstall', true, { os: $_('newOS').value });" class="submit-btn">Reinstall</button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="firewall" role="tabpanel" aria-labelledby="firewall-tab">
                                <div class="head">
                                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/settings.png">
                                    <span class="h3">Firewall</span>
                                </div>

                                <div class="gray-txt mb-3">The rules are evaluated from the top to the bottom. By default, everything is allowed. The firewall is only available on the public interface. Only the inbound traffic will be filtered by the firewall.</div>

                                <div class="table-responsive">
                                    <table id="firewallTable" cellpadding="0" cellspacing="0" border="0" class="table table-hover tablesorter" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Action</th>
                                                <th>Port</th>
                                                <th>Protocol</th>
                                                <th>Source</th>
                                                <th>Note</th>
                                                <th width="50">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <select class="form-control" id="firewallAction" style="width:auto;">
                                                        <option value="ACCEPT">ACCEPT</option>
                                                        <option value="DROP">DROP</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <input class="form-control" id="firewallPort" style="width:auto;" type="number" min="1" max="65535" placeholder="Port number">
                                                </td>
                                                <td>
                                                    <select class="form-control" id="firewallProtocol" style="width:auto;">
                                                        <option value="ANY">ANY</option>
                                                        <option value="ICMP">ICMP</option>
                                                        <option value="TCP">TCP</option>
                                                        <option value="UDP">UDP</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <input class="form-control" id="firewallSource" type="text" maxlength="128" placeholder="Ex: x.x.x.x/xx (optional)">
                                                </td>
                                                <td>
                                                    <input class="form-control" id="firewallNote" type="text" maxlength="64" placeholder="Notes (optional)">
                                                </td>
                                                <td>
                                                    <a href="#" onclick="AndrezzzMVPS_API('Add Firewall rules', true, { firewallAction: $_('firewallAction').value, protocol: $_('firewallProtocol').value, source: $_('firewallSource').value, port: $_('firewallPort').value, note: $_('firewallNote').value });return false;"><i class="fa fa-1x fa-plus create" aria-hidden="true"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <span class="badge badge-warning">The rules must be committed in order to take effect.</span>
                                <br/>
                                <button onclick="AndrezzzMVPS_API('Commit Firewall rules');" class="submit-btn">Commit Firewall</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="backups" role="tabpanel" aria-labelledby="backups-tab">
                <div class="head">
                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/cloud.png">
                    <span class="h3">Backups</span>
                </div>

                <div class="panel bw_div">
                    <div class="gray-txt mb-3">The dates for which backups of this VPS are available are listed below. You can restore or delete them accordingly.</div>

                    <div class="table-responsive">
                        <table id="backupTable" cellpadding="0" cellspacing="0" border="0" class="table table-hover tablesorter" width="100%">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Size</th>
                                    <th>Type</th>
                                    <th>Status</th>
                                    <th width="50">Actions</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>

                    <button onclick="AndrezzzMVPS_API('Create backup');" class="submit-btn">Backup Now</button>

                    <br/>
                    <br/>
                    
                    <div class="gray-txt mb-3">
                        * Please keep in mind that the new backups will replace the older ones.<br/>
                        ** The automated backups will also replace your manual backups unless the automated backups are disabled.<br/>
                        *** The automated backups are made 2 times a week and are part of our disaster recovery plan. If you disable the automated backups, you also disable any chance of recovery in case of a disaster.<br/>
                        **** The backup's file system might not be fully consistent if the VPS was writing to the filesystem at the moment of the backup. For fully consistent backups, the server must be stopped while the backup is being created.
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="rdns" role="tabpanel" aria-labelledby="rdns-tab">
                <div class="head">
                    <img src="{$WEB_ROOT}/modules/servers/AndrezzzMVPS/template/img/search.png">
                    <span class="h3">rDNS Records</span>
                </div>

                <div id="vpsrdns_div">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="rdnsIP" class="form-label mr-1 d-inline-block">IP Address</label>
                                <select class="form-control" name="rdnsIP" id="rdnsIP">
                                    {foreach from=$serverInfo['ips'] item=$ip}
                                    <option value="{$ip}">{$ip}</option>
                                    {/foreach}
                                    {if $serverInfo['ipv6'] !== ''}<option value="{$serverInfo['ipv6']}">{$serverInfo['ipv6']}</option>{/if}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="rdnsDomain" class="form-label mr-1 d-inline-block">Domain name</label>
                                <input class="form-control" type="text" name="rdnsDomain" size="30" id="rdnsDomain"/>
                            </div>
                        </div>
                    </div>

                    <button onclick="AndrezzzMVPS_API('Reverse DNS', true, { ip: $_('rdnsIP').value, val: $_('rdnsDomain').value });" class="submit-btn">Add Reverse DNS</button>
                </div>
            </div>
        </div>
    </div>
</div>