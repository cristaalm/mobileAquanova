import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';

class TableComponent extends StatefulWidget {
  final Option option;
  final List<Map<String, dynamic>> historicalData;

  const TableComponent({
    super.key,
    required this.option,
    required this.historicalData,
  });

  @override
  State<TableComponent> createState() => _TableComponentState();
}

class _TableComponentState extends State<TableComponent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  
  // Para paginación
  int _currentPage = 0;
  final int _itemsPerPage = 15;

  // Datos filtrados basados en la búsqueda
  List<Map<String, dynamic>> get filteredData {
    if (_searchQuery.isEmpty) {
      return widget.historicalData;
    }
    
    return widget.historicalData.where((entry) {
      final timestamp = entry['timestamp'] as String;
      final value = entry['value'] as String;
      final status = widget.option.currentState;
      
      return timestamp.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             value.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             status.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }
  
  // Obtener los datos paginados para la página actual
  List<Map<String, dynamic>> get paginatedData {
    final filtered = filteredData;
    final startIndex = _currentPage * _itemsPerPage;
    
    if (filtered.isEmpty || startIndex >= filtered.length) {
      return [];
    }
    
    final endIndex = (startIndex + _itemsPerPage) > filtered.length 
        ? filtered.length 
        : startIndex + _itemsPerPage;
    
    return filtered.sublist(startIndex, endIndex);
  }
  
  // Número total de páginas
  int get totalPages {
    return (filteredData.length / _itemsPerPage).ceil();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        _currentPage = 0; // Resetear a la primera página al buscar
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  // Get status icon for a specific value
  String _getStatusIconForValue(String valueStr) {
    try {
      final value = double.parse(valueStr.replaceAll(',', '.'));
      final minValue = double.parse(
        widget.option.minValue.replaceAll(',', '.'),
      );
      final maxValue = double.parse(
        widget.option.maxValue.replaceAll(',', '.'),
      );

      if (value > maxValue) {
        return widget.option.iconUpStatus;
      } else if (value < minValue) {
        return widget.option.iconDownStatus;
      } else {
        return widget.option.iconGoodStatus;
      }
    } catch (e) {
      return widget.option.iconGoodStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (widget.option.iconTitle.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: ColorsAquanova.backgroundLight,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.asset(
                      widget.option.iconTitle,
                      width: 20,
                      height: 20,
                      color: ColorsAquanova.darkLetters,
                    ),
                  ),
                Text(
                  'Lecturas',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsAquanova.darkLetters,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // Campo de búsqueda/filtro mejorado
            if (widget.historicalData.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorsAquanova.progressColor),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          Icons.search,
                          color: ColorsAquanova.lightGrey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Fecha, nivel o estado...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: ColorsAquanova.lightGrey,
                            ),
                            suffixIcon:
                                _searchQuery.isNotEmpty
                                    ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                      },
                                    )
                                    : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 8.0),

            // Encabezado de la tabla
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: ColorsAquanova.progressColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Fecha y hora',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsAquanova.lightLetters,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Nivel (${widget.option.unit})',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsAquanova.lightLetters,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Estado',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsAquanova.lightLetters,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Filas de la tabla con datos paginados
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsAquanova.backgroundMedium,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child:
                  filteredData.isEmpty
                      ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.historicalData.isEmpty
                                ? 'No hay datos históricos disponibles'
                                : 'No se encontraron resultados para: $_searchQuery',
                            style: TextStyle(
                              color: ColorsAquanova.backgroundMedium,
                            ),
                          ),
                        ),
                      )
                      : Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: paginatedData.length,
                            itemBuilder: (context, index) {
                              final entry = paginatedData[index];
                              final timestamp = entry['timestamp'] as String;
                              final value = entry['value'] as String;
                              final status = widget.option.currentState;
                            final statusIcon = _getStatusIconForValue(value);
                              final color = widget.option.statusColor;

                              return Container(
                                decoration: BoxDecoration(
                                  border:
                                      index < paginatedData.length - 1
                                          ? Border(
                                            bottom: BorderSide(
                                              color:
                                                  ColorsAquanova
                                                      .backgroundMedium,
                                              width: 1,
                                            ),
                                          )
                                          : null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 3,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          timestamp,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: ColorsAquanova.tableText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                widget.option.iconValue,
                                                width: 15,
                                                height: 25,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color:
                                                      ColorsAquanova.tableText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                statusIcon,
                                                width: 15,
                                                height: 25,
                                                color: color,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                status,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: color,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          // Controles de paginación
                          if (totalPages > 1)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Botón anterior
                                  IconButton(
                                    icon: Icon(Icons.chevron_left),
                                    onPressed:
                                        _currentPage > 0
                                            ? () {
                                              setState(() {
                                                _currentPage--;
                                              });
                                            }
                                            : null,
                                    color:
                                        _currentPage > 0
                                            ? ColorsAquanova.progressColor
                                            : ColorsAquanova.lightGrey,
                                  ),

                                  // Indicador de página
                                  Text(
                                    '${_currentPage + 1} de $totalPages',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsAquanova.darkLetters,
                                    ),
                                  ),

                                  // Botón siguiente
                                  IconButton(
                                    icon: Icon(Icons.chevron_right),
                                    onPressed:
                                        _currentPage < totalPages - 1
                                            ? () {
                                              setState(() {
                                                _currentPage++;
                                              });
                                            }
                                            : null,
                                    color:
                                        _currentPage < totalPages - 1
                                            ? ColorsAquanova.progressColor
                                            : ColorsAquanova.lightGrey,
                                  ),
                                ],
                              ),
                            ),

                          // Resumen de resultados
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              'Mostrando ${paginatedData.length} de ${filteredData.length} registros',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: ColorsAquanova.tableText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}