<?php

namespace App\Http\Controllers\Api;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() 

    {
        return Product::all(); 

    }

    public function store(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required|string|max:255',
        'description' => 'required|string',
        'price' => 'required|numeric',   

        // Add more validation rules as needed
    ]);

    $product = Product::create($validatedData);

    return response()->json($product, 201);
}
public function show($id)
{
    $product = Product::findOrFail($id);

    return response()->json($product);
}
public function update(Request $request, $id)
{
    $product = Product::findOrFail($id);

    $validatedData = $request->validate([
        'name' => 'string|max:255',
        'description' => 'string',
        'price' => 'numeric',
        // Add more validation rules as needed
    ]);

    $product->update($validatedData);

    return response()->json($product);
}
public function destroy($id)
{
    $product = Product::findOrFail($id);
    $product->delete();

    return response()->json(null, 204);
}
}
?>