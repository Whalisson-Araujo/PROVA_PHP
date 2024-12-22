<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contribuicao;

class ContribuicaoController extends Controller
{
    public function index(Request $request)
    {
        $dataMovimento = $request->query('data_movimento');
        $contribuicoes = Contribuicao::whereDate('data_prevista', $dataMovimento)->get();
        return response()->json($contribuicoes);
    }

    public function updateStatus(Request $request, $recibo)
    {
        $contribuicao = Contribuicao::findOrFail($recibo);
        $contribuicao->status = $request->status;
        $contribuicao->data_recebimento = now();
        $contribuicao->save();

        return response()->json(['message' => 'Status atualizado com sucesso!']);
    }
}
