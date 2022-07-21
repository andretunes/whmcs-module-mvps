<?php
/**
 *	MVPS WHMCS Server Provisioning version 1.0
 *
 *	@package     WHMCS
 *	@copyright   Andrezzz
 *	@link        https://www.andrezzz.pt
 *	@author      André Antunes <andreantunes@andrezzz.pt>
 */

if (!defined('WHMCS')) {
    exit(header('Location: https://www.andrezzz.pt'));
}

use WHMCS\Config\Setting;
use WHMCS\Database\Capsule;

function AndrezzzMVPS_API(array $params) {
    $url = 'https://www.mvps.net/api/';
    $data = [];
    $method = '';

    switch ($params['action']) {
        case 'Packages':
            $url .= 'packages';
            $method .= 'GET';
            break;

        case 'Operating Systems':
            $url .= 'os';
            $method .= 'GET';
            break;
            
        case 'Locations':
            $url .= 'locations';
            $method .= 'GET';
            break;

        case 'Discount':
            $url .= 'discount';
            $method .= 'GET';
            break;
           
        case 'Order':
            $url .= 'order';
            $method .= 'POST';
            
            $service = Capsule::table('tblhosting')->where('id', $params['serviceid'])->first();
            $billingCycles = array(
                'Monthly' => 1,
                'Quarterly' => 3,
                'Semi-Annually' => 6,
                'Annually' => 12,
                'Biennially' => 24,
                'Triennially' => 36
            );

            $data += array(
                'package' => AndrezzzMVPS_GetOption($params, 'packageid'),
                'notify_url' => Setting::getValue('SystemURL') . '/modules/servers/AndrezzzMVPS/callback.php',
                'location' => AndrezzzMVPS_GetOption($params, 'locationid'),
                'os' => AndrezzzMVPS_GetOption($params, 'osid'),
                'billing_term' => $billingCycles[$service->billingcycle] ?? 1,
            );
            break;

        case 'Account':
            $url .= 'account';
            $method .= 'GET';
            break;

        case 'Server Info':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']);
            $method .= 'GET';
            break;
        
        case 'Label':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/label';
            $method .= 'POST';

            $data += array(
                'val' => $params['label'],
            );
            break;

        case 'Graphs':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/graph/' . $params['time'];
            $method .= 'GET';
            break;

        case 'Cancel':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/cancel';
            $method .= 'POST';

            $data += array(
                'when' => $params['when'],
            );
            break;

        case 'Stop Cancellation':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/stop-cancellation';
            $method .= 'POST';
            break;

        case 'Reinstall':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/reinstall';
            $method .= 'POST';

            $data += array(
                'os' => $params['os'],
                'notify_url' => Setting::getValue('SystemURL') . '/modules/servers/AndrezzzMVPS/callback.php',
            );
            break;

        case 'Reboot':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/reboot';
            $method .= 'POST';
            break;

        case 'Stop':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/stop';
            $method .= 'POST';
            break;

        case 'Start':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/start';
            $method .= 'POST';
            break;

        case 'Shutdown':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/shutdown';
            $method .= 'POST';
            break;

        case 'Disable':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/disable';
            $method .= 'POST';
            break;

        case 'Enable':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/enable';
            $method .= 'POST';
            break;

        case 'VNC Console':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/vnc';
            $method .= 'GET';
            break;

        case 'Upgrade':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/upgrade';
            $method .= 'POST';

            $data += array(
                'package' => AndrezzzMVPS_GetOption($params, 'packageid'),
            );
            break;

        case 'IPv4 Addresses':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/ipv4';
            $method .= 'GET';
            break;

        case 'Reverse DNS':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/rdns/' . $params['ip'];
            $method .= 'POST';

            $data += array(
                'val' => $params['val']
            );
            break;

        case 'Create backup':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/backup';
            $method .= 'POST';
            break;

        case 'Delete backup':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/backup/' . $params['backup'];
            $method .= 'DELETE';
            break;

        case 'List backups':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/backup';
            $method .= 'GET';
            break;

        case 'Restore backup':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/restore/' . $params['backup'];
            $method .= 'POST';
            break;

        case 'Private Network':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/private-network/' . $params['actionPrivateNetwork'];
            $method .= 'POST';
            break;

        case 'IPv6':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/ipv6';
            $method .= 'POST';
            break;

        case 'Get Firewall rules':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/firewall';
            $method .= 'GET';
            break;

        case 'Add Firewall rules':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/firewall';
            $method .= 'POST';

            $data += array(
                'action' => $params['firewallAction'],
                'protocol' => $params['protocol'],
                'source' => $params['source'],
                'port' => $params['port'],
                'note' => $params['note'],
            );
            break;

        case 'Delete Firewall rule':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/firewall/' . $params['rule_id'];
            $method .= 'DELETE';
            break;

        case 'Commit Firewall rules':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/firewall/resync';
            $method .= 'POST';
            break;

        case 'Reset root':
            $url .= 'vps/' . str_replace('VPS-', '', $params['domain']) . '/reset-root';
            $method .= 'POST';
            break;

        default:
            throw new Exception('Invalid action: ' . $params['action']);
            break;
    }

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
    curl_setopt($curl, CURLOPT_TIMEOUT, 5);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_POSTREDIR, CURL_REDIR_POST_301);
    curl_setopt($curl, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
    curl_setopt($curl, CURLOPT_USERAGENT, 'Andrezzz - MVPS WHMCS');
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('X_API_USER: ' . $params['serverusername'], 'X_API_KEY:  ' . $params['serverpassword']));

    if ($method === 'POST' || $method === 'PATCH') {
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
    }

    $responseData = curl_exec($curl);
    $statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    
    $responseData = json_decode($responseData, true);

    if ($statusCode === 0) throw new Exception('cURL Error: ' . curl_error($curl));

    curl_close($curl);

    logModuleCall(
        'Andrezzz - MVPS',
        $url,
        !empty($data) ? json_encode($data) : '',
        print_r($responseData, true)
    );

    if (isset($responseData['status']) && $responseData['status'] === 'error') throw new Exception($responseData['data']);

    return $responseData['data'];
}

function AndrezzzMVPS_Error($func, $params, Exception $err) {
    logModuleCall('Andrezzz - MVPS', $func, $params, $err->getMessage(), $err->getTraceAsString());
}

function AndrezzzMVPS_MetaData() {
    return array(
        'DisplayName' => 'Andrezzz - MVPS',
        'APIVersion' => '1.1',
        'RequiresServer' => true,
    );
}

function AndrezzzMVPS_ConfigOptions() {
    $os = array();
    $packages = array();
    $locations = array();

    if (basename($_SERVER['SCRIPT_NAME'], '.php') === 'configproducts' && $_REQUEST['action'] === 'module-settings') {
        $id = (int) $_REQUEST['id'];

        $product = Capsule::table('tblproducts')->where('id', $id)->first();
        $servergroup = Capsule::table('tblservergroupsrel')->where('groupid', $product->servergroup)->first();
        if (!$servergroup) return;
        
        $server = Capsule::table('tblservers')->where('id', $servergroup->serverid)->first();
    
        $params = array(
            'serverusername' => $server->username,
            'serverpassword' => decrypt($server->password),
        );
    
        $params['action'] = 'Operating Systems';
        $operatingSystems = AndrezzzMVPS_API($params);

        $params['action'] = 'Packages';
        $packageslist = AndrezzzMVPS_API($params);

        $params['action'] = 'Locations';
        $locationslist = AndrezzzMVPS_API($params);
    
        foreach ($operatingSystems as $operatingSystem) {
            $os += array(
                $operatingSystem['id'] => $operatingSystem['name'] . ' (€' . $operatingSystem['price'] . ' EUR)'
            );
        }
    
        foreach ($packageslist as $package) {
            $packages += array(
                $package['id'] => $package['name'] . ' (€' . $package['price'] . ' EUR)'
            );
        }
    
        foreach ($locationslist as $location) {
            $locations += array(
                $location['id'] => $location['name']
            );
        }
    }
    
    return array(
        'packageid' => array(
            'FriendlyName' => 'Package',
            'Description' => 'The Package desired (Configurable option: packageid).',
            'Type' => 'dropdown',
            'Options' => $packages,
        ),
        'locationid' => array(
            'FriendlyName' => 'Server location',
            'Description' => 'The Operating System desired (Configurable option: locationid).',
            'Type' => 'dropdown',
            'Options' => $locations,
        ),
        'osid' => array(
            'FriendlyName' => 'Operating System',
            'Description' => 'The Operating System desired (Configurable option: osid).',
            'Type' => 'dropdown',
            'Options' => $os,
        ),
    );
}

function AndrezzzMVPS_GetOption(array $params, $id, $default = NULL) {
    $options = AndrezzzMVPS_ConfigOptions();

    $friendlyName = $options[$id]['FriendlyName'];

    if (isset($params['configoptions'][$friendlyName]) && $params['configoptions'][$friendlyName] !== '') {
        return $params['configoptions'][$friendlyName];
    } else if (isset($params['configoptions'][$id]) && $params['configoptions'][$id] !== '') {
        return $params['configoptions'][$id];
    } else if (isset($params['customfields'][$friendlyName]) && $params['customfields'][$friendlyName] !== '') {
        return $params['customfields'][$friendlyName];
    } else if (isset($params['customfields'][$id]) && $params['customfields'][$id] !== '') {
        return $params['customfields'][$id];
    }

    $found = false;
    $i = 0;
    
    foreach ($options as $key => $value) {
        $i++;
        if ($key === $id) {
            $found = true;
            break;
        }
    }

    if ($found && isset($params['configoption' . $i]) && $params['configoption' . $i] !== '') {
        return $params['configoption' . $i];
    }

    return $default;
}

function AndrezzzMVPS_TestConnection(array $params) {
    $err = '';

    try {
        $params['action'] = 'Account';
        AndrezzzMVPS_API($params);
    } catch(Exception $e) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $e);
        $err = 'Received the error: ' . $e->getMessage() . ' Check module debug log for more detailed error.';
    }

    return [
        'success' => $err === '',
        'error' => $err,
    ];
}

function AndrezzzMVPS_CreateAccount(array $params) {
    try {
        $params['action'] = 'Order';
        $create = AndrezzzMVPS_API($params);

        Capsule::table('tblhosting')->where('id', $params['serviceid'])->update(array(
            'domain' => 'VPS-' . $create['id'],
        ));
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }
    
    return 'success';
}

function AndrezzzMVPS_SuspendAccount(array $params) {
    try {
        $params['action'] = 'Disable';
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_UnsuspendAccount(array $params) {
    try {
        $params['action'] = 'Enable';
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_TerminateAccount(array $params) {
    try {
        $params['action'] = 'Cancel';
        $params['when'] = 'now';
        AndrezzzMVPS_API($params);

        Capsule::table('tblhosting')->where('id', $params['serviceid'])->update(array(
            'username' => '',
            'password' => '',
        ));
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

// function AndrezzzMVPS_ChangePassword(array $params) {
//     try {
//         $params['action'] = 'ChangePassword';
//         AndrezzzMVPS_API($params);
//     } catch(Exception $err) {
//         AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
//         return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
//     }

//     return 'success';
// }

function AndrezzzMVPS_ChangePackage(array $params) {
    try {
        $params['action'] = 'Upgrade';
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_Start(array $params) {
    try {
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_Reboot(array $params) {
    try {
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_Stop(array $params) {
    try {
        AndrezzzMVPS_API($params);
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }

    return 'success';
}

function AndrezzzMVPS_VNC(array $params) {
    try {
        $params['action'] = 'VNC Console';
        $vnc = AndrezzzMVPS_API($params);

        // echo '<iframe src="' . $vnc['vnc_url'] . '" scrolling="auto" height="100%" width="100%" frameborder="0" style="margin:-8px;"></iframe>';
        header('Location: ' . $vnc['vnc_url']);
        WHMCS\Terminus::getInstance()->doExit();
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);

        return array(
            'templatefile' => 'template/error',
            'templateVariables' => array(
                'error' => $err->getMessage(),
            ),
        );
    }
}

function AndrezzzMVPS_ClientAreaAPI(array $params) {
    try {
        $action = App::getFromRequest('api');
        $actions = array('Operating Systems', 'Server Info', 'Reinstall', 'Start', 'Reboot', 'Stop', 'VNC Console', 'IPv6', 'Graphs', 'Reverse DNS', 'Create backup', 'Delete backup', 'List backups', 'Restore backup', 'Get Firewall rules', 'Add Firewall rules', 'Delete Firewall rule', 'Commit Firewall rules', 'Reset root');
        $results = array('result' => 'success');

        if (in_array($action, $actions)) {
            foreach ($_POST as $key => $value) {
                $params[$key] = $value;
            }

            $params['action'] = $action;
            $result = AndrezzzMVPS_API($params);
            $results = array_merge($results, is_array($result) ? $result : array('data' => $result));

            return array('jsonResponse' => $results);
        } else {
            throw new Exception('Action not found');
        }
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return array('jsonResponse' => array('result' => 'error', 'message' => $err->getMessage()));
    }
}

function AndrezzzMVPS_AdminCustomButtonArray() {
    return array(
        'Start' => 'Start',
        'Reboot' => 'Reboot',
        'Stop'=> 'Stop',
        'VNC Console'=> 'VNC',
	);
}

function AndrezzzMVPS_ClientAreaCustomButtonArray() {
    return array(
        'Start' => 'Start',
        'Reboot' => 'Reboot',
        'Stop'=> 'Stop',
        'VNC Console'=> 'VNC',
	);
}

function AndrezzzMVPS_ClientAreaAllowedFunctions() {
    return array('ClientAreaAPI');
}

function AndrezzzMVPS_ClientArea(array $params) {
    if ($params['moduletype'] !== 'AndrezzzMVPS') return;

    try {
        $params['action'] = 'Server Info';
        $serverInfo = AndrezzzMVPS_API($params);

        $params['action'] = 'Packages';
        $packages = AndrezzzMVPS_API($params);

        $params['action'] = 'Locations';
        $locations = AndrezzzMVPS_API($params);

        $params['action'] = 'Operating Systems';
        $operatingSystems = AndrezzzMVPS_API($params);

        $dirLocations = __DIR__ . '/template/img/flags/';
        $availableLocations = glob($dirLocations . '*.png');
        
        foreach ($availableLocations as $key => $location) {
            $availableLocations[$key] = explode('.png', explode($dirLocations, $location)[1])[0];
        }

        foreach ($locations as $key => $location) {
            $locations[$key]['img'] = (in_array($location['id'], $availableLocations) ? $location['id'] : 'no-flag');
        }
        
        $serverInfo['location'] = array_search($serverInfo['location'], array_column($locations, 'id'));
        $serverInfo['location'] = $locations[$serverInfo['location']];

        $dirOS = __DIR__ . '/template/img/os/';
        $availableOS = glob($dirOS . '*.png');
        $operatingSystemsGrouped = array();
        
        foreach ($availableOS as $key => $os) {
            $availableOS[$key] = explode('.png', explode($dirOS, $os)[1])[0];
        }

        foreach ($operatingSystems as $key => $operatingSystem) {
            $group = $operatingSystem['group'];
            
            if (!isset($operatingSystemsGrouped[$group])) {
                $operatingSystemsGrouped[$group] = array(
                    'name' => $operatingSystem['group_name'],
                    'versions' => array(),
                );
            }
            
            $operatingSystems[$key]['group_img'] = (in_array($group, $availableOS) ? $operatingSystem['group'] : 'others');
            $operatingSystemsGrouped[$os['group']]['versions'][] = $os;
        }
        
        $serverInfo['operatingSystem'] = $serverInfo['os'];
        $serverInfo['operatingSystem'] = array_search($serverInfo['operatingSystem'], array_column($operatingSystems, 'id'));
        $serverInfo['operatingSystem'] = $operatingSystems[$serverInfo['operatingSystem']];
        
        $serverInfo['status'] = $serverInfo['status'] !== 'ok' ? $serverInfo['status'] : $serverInfo['vm_status'];
        $serverInfo['statusDescription'] = $serverInfo['status'] !== 'ok' ? ucfirst($serverInfo['status']) : ucfirst($serverInfo['vm_status']);

        $serverInfo['package'] = array_search($serverInfo['package'], array_column($packages, 'id'));
        $serverInfo['package'] = $packages[$serverInfo['package']];
        
        $serverInfo['cpu_usage'] = $serverInfo['cpu_usage'] * 100;

        return array(
            'templatefile' => 'template/clientarea',
            'vars' => array(
                'serverInfo' => $serverInfo,
                'locations' => $locations,
                'operatingSystems' => $operatingSystems,
                'operatingSystemsGrouped' => $operatingSystemsGrouped,
            ),
        );
    } catch (Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);

        return array(
            'templatefile' => 'template/error',
            'templateVariables' => array(
                'error' => $err->getMessage(),
            ),
        );
    }
}

function AndrezzzMVPS_AdminLink(array $params) {
    try {
        $params['action'] = 'Account';
        $account = AndrezzzMVPS_API($params);

        $params['action'] = 'Discount';
        $discount = AndrezzzMVPS_API($params);

        return '<i class="fa fa-coins"></i> Balance: €' . $account['balance'] . ' EUR<br><i class="fa fa-badge-percent"></i> Discount: ' . $discount['percent'] . '%';
    } catch(Exception $err) {
        AndrezzzMVPS_Error(__FUNCTION__, $params, $err);
        return 'Received the error: ' . $err->getMessage() . ' Check module debug log for more detailed error.';
    }
}