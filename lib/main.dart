import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan package 'intl' di pubspec.yaml untuk format mata uang

void main() {
  runApp(const MyApp());
}

// Model Data untuk Produk 
class Product {
  final String imageUrl;
  final String category;
  final String name;
  final double price;
  final double oldPrice;
  final String unit;
  final int discountPercent;

  const Product({
    required this.imageUrl,
    required this.category,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.unit,
    required this.discountPercent,
  });
}

// Halaman utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijau Mart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        // Warna latar belakang
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProductGridScreen(),
    );
  }
}

// Bg grid produk
class ProductGridScreen extends StatefulWidget {
  const ProductGridScreen({super.key});

  @override
  State<ProductGridScreen> createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  // Daftar kategori 
  final List<String> categories = [
    'Semua',
    'Sayur',
    'Buah',
    'Daging',
    'Palawija',
    'Paket Murah'
  ];
  String _selectedCategory = 'Semua'; 

  @override
  Widget build(BuildContext context) {
   
    // Daftar produk
    final List<Product> products = const [
      Product(
        name: 'Sawi Daging Segar',
        category: 'Sayur',
        price: 22000,
        oldPrice: 25000,
        unit: '/ 1 kg',
        discountPercent: 10,
        imageUrl: 'assets/images/sawidaging.jpg',
      ),
      Product(
        name: 'Tomat Merah',
        category: 'Sayur',
        price: 5500,
        oldPrice: 8500,
        unit: '/ 250 g',
        discountPercent: 35,
        imageUrl: 'assets/images/tomat.jpg',
      ),
      Product(
        name: 'Cabai Merah Pedas',
        category: 'Sayur', 
        price: 23137,
        oldPrice: 35595,
        unit: '/ 1 kg',
        discountPercent: 35,
        imageUrl: 'assets/images/cabai.jpg',
      ),
      Product(
        name: 'Brokoli Segar',
        category: 'Sayur',
        price: 20800,
        oldPrice: 32000,
        unit: '/ 1 kg',
        discountPercent: 20,
        imageUrl: 'assets/images/brokoli.jpg',
      ),
      Product(
        name: 'Alpukat Mentega',
        category: 'Buah',
        price: 15000,
        oldPrice: 18000,
        unit: '/ 250 g',
        discountPercent: 17,
        imageUrl: 'assets/images/apukat.jpg',
      ),
      Product(
        name: 'Anggur Merah',
        category: 'Buah', 
        price: 28000,
        oldPrice: 35000,
        unit: '/ 1 kg',
        discountPercent: 20,
        imageUrl: 'assets/images/anggur.jpg',
      ),
      Product(
        name: 'Semangka Manis',
        category: 'Buah',
        price: 22000,
        oldPrice: 25000,
        unit: '/ 1 kg',
        discountPercent: 10,
        imageUrl: 'assets/images/semangka.jpg',
      ),
      Product(
        name: 'Daging Sapi Premium',
        category: 'Daging',
        price: 5500,
        oldPrice: 8500,
        unit: '/ 250 g',
        discountPercent: 35,
        imageUrl: 'assets/images/daging.jpg',
      ),
      Product(
        name: 'Jeruk Sunkist',
        category: 'Buah', 
        price: 23137,
        oldPrice: 35595,
        unit: '/ 1 kg',
        discountPercent: 35,
        imageUrl: 'assets/images/jeruk.jpg',
      ),
      Product(
        name: 'Labu Kuning',
        category: 'Buah',
        price: 20800,
        oldPrice: 32000,
        unit: '/ 1 kg',
        discountPercent: 20,
        imageUrl: 'assets/images/labu.jpg',
      ),
      Product(
        name: 'Temu Kunci',
        category: 'Sayur',
        price: 15000,
        oldPrice: 18000,
        unit: '/ 250 g',
        discountPercent: 17,
        imageUrl: 'assets/images/kunci.jpg',
      ),
      Product(
        name: 'Stroberi Lokal',
        category: 'Buah', 
        price: 28000,
        oldPrice: 35000,
        unit: '/ 1 kg',
        discountPercent: 20,
        imageUrl: 'assets/images/sroberi.jpg',
      ),
    ];
  
    // App bar bagian atas
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, 
        toolbarHeight: 50.0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HijauMart',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Kebutuhan dapur anda',
                style: TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),
        actions: const [],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(124.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Pencarian
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Row(
                    children: [
                      // Container + Shadow
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8.0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 16),
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Tombol filter 
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 8.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.tune, color: Colors.white),
                          onPressed: () {
                            print('Filter button pressed!');
                          },
                          tooltip: 'Filter',
                        ),
                      ),
                    ],
                  ),
                ),

                // Widget kategori
                SizedBox(
                  height: 44.0, // Tinggi tetap untuk list kategori
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Scroll ke samping
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final bool isActive = category == _selectedCategory;

                      // Aktif
                      final Color bgColor =
                          isActive ? Colors.green : Colors.white;
                      // Tidak aktif
                      final Color textColor =
                          isActive ? Colors.white : Colors.grey[600]!;

                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0), 
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(12.0),
                              border: isActive
                                  ? null
                                  : Border.all(color: Colors.grey[300]!),
                            ),
                            child: Row(
                              children: [
                                
                                Center(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w600, 
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
      ),
    );
  }
}

// Widget kartu produk 
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isInteracted = false;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      shadowColor: Colors.black.withOpacity(0.4), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: _isInteracted
            ? const BorderSide(color: Colors.green, width: 1.5)
            : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          print('Tap on ${widget.product.name}');
        },
        onHover: (value) {
          setState(() {
            _isInteracted = value;
          });
        },
        onHighlightChanged: (value) {
          setState(() {
            _isInteracted = value;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, color: Colors.grey);
                    },
                  ),
                ),
              ],
            ),

            // Teks 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end, // Mendorong ke bawah
                  children: [
                    // Kategori & Nama Produk
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Harga dan tombol
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Kolom Harga
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Harga Baru dan jumlah
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  currencyFormatter.format(widget.product.price),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  ' ${widget.product.unit}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            // Harga Coret
                            Text(
                              currencyFormatter.format(widget.product.oldPrice),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),

                        // Tombol
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}