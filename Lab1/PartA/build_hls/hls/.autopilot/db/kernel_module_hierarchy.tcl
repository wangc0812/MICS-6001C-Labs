set ModuleHierarchy {[{
"Name" : "real_matmul","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_real_matmul_Pipeline_MAT_A_ROWS_MAT_A_COLS_fu_127","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "MAT_A_ROWS_MAT_A_COLS","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_real_matmul_Pipeline_MAT_C_ROWS_INIT_MAT_C_COLS_INIT_fu_137","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "MAT_C_ROWS_INIT_MAT_C_COLS_INIT","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_real_matmul_Pipeline_MAT_B_ROWS_MAT_B_COLS_fu_143","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "MAT_B_ROWS_MAT_B_COLS","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_real_matmul_Pipeline_OUTER_ROWS_OUTER_COLS_fu_151","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "OUTER_ROWS_OUTER_COLS","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_real_matmul_Pipeline_MAT_C_ROWS_MAT_C_COLS_fu_158","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "MAT_C_ROWS_MAT_C_COLS","ID" : "10","Type" : "pipeline"},]},]
}]}