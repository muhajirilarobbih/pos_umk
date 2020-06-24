<?php

namespace App\Controllers;

use App\Models\Pembelian_model;
use App\Models\Pos_model;

class Pembelian extends BaseController
{
	protected $request;

	function __construct()
	{
		$request = \Config\Services::request();
		$this->model_pembelian = new Pembelian_model();
	}

	public function index()
	{
		$model = new Pembelian_model();
		$mpos = new Pos_model();
		helper('TimeHelper');
		helper('Umkm');
		$paginate = 10;
		// $model = new Pembelian_model();
		$data = [
			'nota_pembelian' => $this->getNotaPembelian(),
			'm_pembelian' => $model->join('data_suplier', 'data_suplier.id_suplier = master_pembelian.id_suplier', 'left')->paginate($paginate, 'pembelian'),
			'pager' => $model->pager,
			'produk' => $mpos->getListProduk(),
			'data_suplier' => $model->getListSuplier()
		];

		// generate number untuk tetap bertambah meskipun pindah halaman paginate
		$nomor = $this->request->getGet('page_product');
		// define $nomor = 1 jika tidak ada get page_product
		if ($nomor == null) {
			$nomor = 1;
		}
		$data['nomor'] = ($nomor - 1) * $paginate;

		return view('admin/pembelian_view', $data);
	}

	public function getNotaPembelian()
	{
		$model = new Pembelian_model();
		$var_head = "BL";
		return $var_head . date('ymdHis');
	}

	//--------------------------------------------------------------------
	/**
	 * Add Pembelian
	 */
	public function add()
	{
		/**
		 * Simpan table temp pembelian ke table trx
		 */
	}

	public function addTrx()
	{
	}

	public function delete()
	{
	}

	public function edit()
	{
	}

	public function selesai_pembelian()
	{
		$model = new Pembelian_model();
		$kd_trx     = $this->request->getPost('kd_trx');
		$keterangan = $this->request->getPost('keterangan');
		$userId = 21; //user
		$idSuplier = $this->request->getPost('id_suplier');
		$result = $model->selesaipembelian($kd_trx, $idSuplier, $userId, $keterangan);
		// var_dump($result);
		if ($result) {
			$response['success'] = true;
		} else {
			$response['success'] = false;
		}
		echo json_encode($response);
	}

	public function getcekdb()
	{
		$model= new Pembelian_model();
		$result = $model->testSelect();
		var_dump($result);
		echo date('Y-m-d H:i:s');
	}

	public function addBeliTemp()
	{
		$model = new Pembelian_model();
		$data = array(
			'kd_trx_pembelian' => $this->request->getVar('kd_trx'),
			'kd_produk'  => $this->request->getVar('id_barang'),
			'harga'  => $this->request->getVar('harga_beli'),
			'qty'  => $this->request->getVar('qty'),
			'nama_barang'  => $this->request->getVar('nama_produk'),
			'total'  => doubleval($this->request->getVar('harga_beli')) * doubleval($this->request->getVar('qty')),
			'diskon'  => $this->request->getVar('diskon'),
			'created_date'  => date('Y-m-d')
		);

		$r_insert = $model->addDataPembelianTemp($data);
		$response = array();
		if ($r_insert != NULL) {
			$response['success'] = true;
		} else {
			$response['success'] = false;
		}
		echo json_encode($response);
	}

	public function getProdukSelect()
	{
		$searchby = $this->request->getVar('searchTerm');
		$data = array();
		$model = new Pos_model();
		$dataProduk = $model->getDataProdukSearch($searchby)->getResult('array');

		foreach ($dataProduk as $row) {
			$data[] = array("id" => $row['kd_produk'], "text" => $row['nama_produk']);
		}
		echo json_encode($data);
	}

	public function getSuplier()
	{
		$searchby = $this->request->getVar('searchTerm');
		$data = array();
		$model = new Pos_model();
		$dataSplr = $model->getListSuplier($searchby)->getResult('array');

		foreach ($dataSplr as $row) {
			$data[] = array("id" => $row['id_suplier'], "text" => $row['nama_suplier']);
		}
		echo json_encode($data);
	}
	/**
	 * Menampilkan produk sesuai pencarian
	 * return nama,harga beli teraakhir 
	 */
	public function getProduk($searchby = null)
	{
		// $something = $this->request->getVar('foo');
		$model = new Pos_model();
		$mbeli = new Pembelian_model();
		$dataProduk = $model->getDataProdukBySearch($searchby)->getRow();
		$hbeliterakhir = $mbeli->getHargaBeliTerakhir($searchby)->getRow();

		$hbeli = 0;
		$stok = 0;
		if ($hbeliterakhir != NULL) {
			$hbeli = $hbeliterakhir->harga;
		}

		$stok = $dataProduk->stok == NULL ? 0 : $dataProduk->stok;

		// var_dump($hbeliterakhir);
		// echo $hbeliterakhir == NULL ?'ok':'ik';
		// // print_r($something);
		// exit();
		echo '
		<div class="form-group">
		<label class="control-label col-md-3">Harga Beli Terakhir</label>
			<div class="col-md-9">
				<input name="hbelilast" disabled id="hbelilast" class="form-control" value="' . $hbeli . '" type="number">
				<span class="help-block"></span>
			</div>
		</div>

		<input type="hidden" name="nama_produk" id="nama_produk" value="' . $dataProduk->nama_produk . '"/>
		<input type="hidden" name="tot_stok" id="tot_stok" value="' . $dataProduk->stok . '"/>
		<input type="hidden" name="url_image" id="url_image" value="' . $dataProduk->gambar . '"/>
		<div class="form-group">
		<label class="control-label col-md-3">Sisa Stok</label>
		<div class="col-md-2">
			<input name="stok" disabled id="stok" class="form-control" value="' . $stok . '" type="number">
			<span class="help-block"></span>
		</div>
	</div>';
	}

	public function getCekRow($kd_trxbeli)
	{
		// untuk cek ada berapa row base in kd trx
		$mbeli = new Pembelian_model();
		$r_temp = $mbeli->getCountTempPembelian($kd_trxbeli);
		$response = array();
		if ($r_temp != NULL) {
			$response['success'] = true;
			$response['total_row'] = $r_temp->getRow()->total_row;
		} else {
			$response['success'] = false;
			$response['total_row'] = $r_temp->getRow()->total_row;
		}
		echo json_encode($response);
	}
	public function getTempTable($kd_trxbeli)
	{
		$mbeli = new Pembelian_model();
		$r_temp = $mbeli->getTempPembelian($kd_trxbeli);
		$r_total = $mbeli->getTotalPembelian($kd_trxbeli);
		$result = '';
		$no = 1;
		foreach ($r_temp->getResult() as $rows) {
			$result .= '<tr>' .
				'<td>' . $no . '</td>' .
				'<td>' . $rows->kd_trx_pembelian . '</td>' .
				'<td>' . $rows->nama_barang . '</td>' .
				'<td>' . number_format($rows->harga, 0, '', '.') . '</td>' .
				'<td>' . $rows->qty . '</td>' .
				'<td>' . $rows->diskon . '</td>' .
				'<td>' . number_format($rows->total, 0, '', '.') . '</td>' .
				'<td>' . $rows->keterangan . '</td>' .
				'<td><div class="hidden-md hidden-lg">
				<div class="inline pos-rel">
					<button type="button" class="btn-xs	 btn-block btn-outline-danger small" onclick=delete_tabtemp(' . "'" . $rows->id_pembelian . "'" . ')> <i class="fa fa-trash"></i> Hapus</button>
				</div>
			</div></td>' .
				'</tr>';
			$no++;
		}
		$total = '<tr>' .
			'<td colspan="7"></td>' .
			'<td>Total</td>' .
			'<td>' . number_format($r_total->getRow('total'), 0, '', '.') . '</td>' .
			'</tr>';
		echo $result . $total;
	}
	public function tempDelete($id)
	{
		$mbeli = new Pembelian_model();
		$r_temp = $mbeli->delTempPembelian($id);
		$response = array();
		if ($r_temp != NULL) {
			$response['success'] = true;
		} else {
			$response['success'] = false;
		}
		echo json_encode($response);
	}

	public function cetak_notabeli($kdtrx)
	{
	}
}
