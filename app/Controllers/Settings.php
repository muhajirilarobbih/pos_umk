<?php

namespace App\Controllers;

use App\Models\Setting_model;

class Settings extends BaseController
{
	/**
	 * apps setting
	 */
	public function index()
	{
		$model = new Setting_model();
		$data = array();
		$data['data'] = $model->getSetting();
		// var_dump($data['nama_apps']);
		return view('admin/settings/general', $data);
	}

	public function updateGeneralSetting()
	{
		$data = [
			'nama_usaha' => $this->request->getPost('nama_usaha'),
			'alamat_usaha' => $this->request->getPost('alamat_usaha'),
			'no_tlpn' => $this->request->getPost('no_tlpn'),
			'no_wa' => $this->request->getPost('no_wa'),
		];
		$model = new Setting_model();
		$update = $model->updateSetting($data);
		if ($update) {
			// Deklarasikan session flashdata dengan tipe success
			session()->setFlashdata('success', 'Update General Setting successfully');
			// Redirect halaman ke product
			return redirect()->to(base_url('settings'));
		}
	}
}
