<?php
/**
 *	MVPS WHMCS Server Provisioning version 1.1
 *
 *	@package     WHMCS
 *	@copyright   Andrezzz
 *	@link        https://www.andrezzz.pt
 *	@author      André Antunes <andreantunes@andrezzz.pt>
 */

if (empty($_POST)) {
    exit(header('Location: https://www.andrezzz.pt'));
}

require_once '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'init.php';
require_once ROOTDIR . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'servers' . DIRECTORY_SEPARATOR . 'AndrezzzMVPS' . DIRECTORY_SEPARATOR . 'AndrezzzMVPS.php';

use WHMCS\Database\Capsule;

$_POST = array_map('html_entity_decode', $_POST);

$service = Capsule::table('tblhosting')->where('domain', 'VPS-' . $_POST['id'])->first();
$server = Capsule::table('tblservers')->where('id', $service->server)->first();

if (!$service) exit(header('Location: https://www.andrezzz.pt'));

$rawSig = '';
ksort($_POST, SORT_STRING);

foreach ($_POST as $key => $value) {
    if ($key === 'sig') continue;
    $rawSig .= $value;
}

$rawSig .= decrypt($server->password);
$signature = hash('sha256', $rawSig);

if ($_POST['sig'] != $signature) exit(header('Location: https://www.andrezzz.pt'));

$params = array(
    'serverusername' => $server->username,
    'serverpassword' => decrypt($server->password),
    'action' => 'Label',
    'label' => 'WHMCS ' . $service->id,
    'domain' => $service->domain,
);
AndrezzzMVPS_API($params);

if (gettype($_POST['ips']) !== 'array') $_POST['ips'] = json_decode($_POST['ips']);

Capsule::table('tblhosting')->where('id', $service->id)->update(array(
    'username' => $_POST['username'],
    'password' => encrypt($_POST['root']),
    'dedicatedip' => $_POST['ips'][0],
    'assignedips' => !array_shift($_POST['ips']) ?: implode('\n', $_POST['ips']),
));

echo '*ok*';