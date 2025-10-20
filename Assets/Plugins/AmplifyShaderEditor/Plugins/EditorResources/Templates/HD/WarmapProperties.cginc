#ifndef WARMAP_PROPS
#define WARMAP_PROPS

StructuredBuffer<WarmapCellShaderStruct> _WarmapCellsBuffer;
int _WarmapCellsCount;

StructuredBuffer<WarmapRegionShaderStruct> _WarmapRegionsBuffer;
int _WarmapRegionsCount;

StructuredBuffer<int> _WarmapCellNeighborsBuffer;
int _WarmapCellNeighborsMaxCount;

StructuredBuffer<float3> _WarmapCircumcentersBuffer;
int _WarmapCircumcentersCount;

StructuredBuffer<int> _WarmapRegionEdgesBuffer;
int _WarmapRegionEdgesMaxCount;

StructuredBuffer<int> _WarmapBiomeEdgesBuffer;
int _WarmapBiomeEdgesCount;

StructuredBuffer<CircumcenterBiomeIntersection> _WarmapCircumcentersIntersectionsBuffer;
int _WarmapBiomeEdgesMaxCount;

StructuredBuffer<int> _WarmapFlatGridIndiciesBuffer;
StructuredBuffer<int> _WarmapFlatGridLimitsBuffer;
int _WarmapFlatGridLimitsCount;

int _xSlices;
int _ySlices;
int _zSlices;

#endif