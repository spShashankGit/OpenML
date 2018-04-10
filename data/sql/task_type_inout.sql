INSERT INTO `task_type_inout` (`ttid`, `name`, `type`, `io`, `requirement`, `description`, `order`, `api_constraints`, `template_api`, `template_search`) VALUES
(1, 'cost_matrix', 'CostMatrix', 'input', 'optional', 'A matrix describing the cost of miss-classifications per type. ', 21, '{\r\n  \"data_type\": \"json\"\r\n}', '<oml:cost_matrix>[INPUT:cost_matrix]</oml:cost_matrix>', '{ \"name\": \"Specify cost matrix (optional):\", \"placeholder\": \"Experimental. Only allowed with one dataset selected in the dataset(s) field\"}'),
(1, 'custom_testset', 'KeyValue', 'input', 'hidden', 'If applicable, the user can specify a custom testset', 22, '{\r\n  \"data_type\": \"json\"\r\n}', NULL, '{ \"name\": \"Specify row id\'s (0-based):\", \"placeholder\": \"Experimental. Only allowed with one dataset selected in the dataset(s) field\"}'),
(1, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"number_folds\">[LOOKUP:estimation_procedure.folds]</oml:parameter>\r\n<oml:parameter name=\"percentage\">[LOOKUP:estimation_procedure.percentage]</oml:parameter>\r\n<oml:parameter name=\"stratified_sampling\">[LOOKUP:estimation_procedure.stratified_sampling]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(1, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(1, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(1, 'model', 'File', 'output', 'optional', 'A file containing the model built on all the input data.', 60, NULL, NULL, NULL),
(1, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"integer\"/>\r\n<oml:feature name=\"fold\" type=\"integer\"/>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"confidence.classname\" type=\"numeric\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(1, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(1, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"nominal\\\"\"\r\n}', NULL, '{\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(2, 'custom_testset', 'KeyValue', 'input', 'hidden', 'If applicable, the user can specify a custom testset', 22, '{\r\n  \"data_type\": \"json\"\r\n}', NULL, '{ \"name\": \"Specify row id\'s (0-based):\", \"placeholder\": \"Experimental. Only allowed with one dataset selected in the dataset(s) field\"}'),
(2, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]/api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"number_folds\">[LOOKUP:estimation_procedure.folds]</oml:parameter>\r\n<oml:parameter name=\"percentage\">[LOOKUP:estimation_procedure.percentage]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(2, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(2, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, predictive_accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\",\r\n  \"default\": \"predictive_accuracy\"\r\n}'),
(2, 'model', 'File', 'output', 'optional', 'A file containing the model built on all the input data.', 60, NULL, NULL, NULL),
(2, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"integer\"/>\r\n<oml:feature name=\"fold\" type=\"integer\"/>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(2, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(2, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"numeric\\\"\"\r\n}', NULL, '{\r\n  \"default\": \"class\",\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(3, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]/api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"number_folds\">[LOOKUP:estimation_procedure.folds]</oml:parameter>\r\n<oml:parameter name=\"number_samples\">[INPUT:number_samples]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(3, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(3, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(3, 'number_samples', 'String', 'input', 'hidden', 'The (maximum) number of samples to return, or the number of points on the learning curve. The sample sizes grow exponentially as a power of two.', 60, NULL, NULL, NULL),
(3, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"integer\"/>\r\n<oml:feature name=\"fold\" type=\"integer\"/>\r\n<oml:feature name=\"sample\" type=\"integer\"/>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"confidence.classname\" type=\"numeric\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(3, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(3, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"nominal\\\"\"\r\n}', NULL, '{\r\n  \"default\": \"class\",\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(4, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type></oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(4, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(4, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(4, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"confidence.classname\" type=\"numeric\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(4, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(4, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"nominal\\\"\"\r\n}', NULL, '{\r\n  \"default\": \"class\",\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(5, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to assess the quality of the clustered', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"stratified_sampling\">[LOOKUP:estimation_procedure.stratified_sampling]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(5, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(5, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., log likelihood', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(5, 'model', 'File', 'output', 'optional', 'A file containing the model built on all the input data.', 60, NULL, NULL, NULL),
(5, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"numeric\"/>\r\n<oml:feature name=\"row_id\" type=\"numeric\"/>\r\n<oml:feature name=\"cluster\" type=\"numeric\"/>\r\n</oml:predictions>', NULL),
(5, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(6, 'cost_matrix', 'CostMatrix', 'input', 'optional', 'A matrix describing the cost of miss-classifications per type. ', 21, '{\r\n  \"data_type\": \"json\"\r\n}', '<oml:cost_matrix>[INPUT:cost_matrix]</oml:cost_matrix>', '{ \"name\": \"Specify cost matrix (optional):\", \"placeholder\": \"Experimental. Only allowed with one dataset selected in the dataset(s) field\"}'),
(6, 'custom_testset', 'KeyValue', 'input', 'hidden', 'If applicable, the user can specify a custom testset', 22, '{\r\n  \"data_type\": \"json\"\r\n}', NULL, '{ \"name\": \"Specify row id\'s (0-based):\", \"placeholder\": \"Experimental. Only allowed with one dataset selected in the dataset(s) field\"}'),
(6, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"number_folds\">[LOOKUP:estimation_procedure.folds]</oml:parameter>\r\n<oml:parameter name=\"percentage\">[LOOKUP:estimation_procedure.percentage]</oml:parameter>\r\n<oml:parameter name=\"stratified_sampling\">[LOOKUP:estimation_procedure.stratified_sampling]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(6, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(6, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(6, 'model', 'File', 'output', 'optional', 'A file containing the model built on all the input data.', 60, NULL, NULL, NULL),
(6, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"integer\"/>\r\n<oml:feature name=\"fold\" type=\"integer\"/>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"confidence.classname\" type=\"numeric\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(6, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:labeled_data_set_id>[INPUT:source_data_labeled]</oml:labeled_data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset\",\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"Select at least one dataset\"\r\n}'),
(6, 'source_data_labeled', 'Dataset', 'input', 'required', 'The labelled version of the dataset', 13, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', NULL, '{\r\n  \"name\": \"Dataset (labelled)\",\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"Select at least one dataset\"\r\n}'),
(6, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"nominal\\\"\"\r\n}', NULL, '{\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(7, 'estimation_procedure', 'Estimation Procedure', 'input', 'required', 'The estimation procedure used to validate the generated models', 20, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"id\",\r\n\"from\": \"estimation_procedure\",\r\n\"where\": \"ttid = [TASK:ttid]\"\r\n}', '<oml:estimation_procedure>\r\n<oml:type>[LOOKUP:estimation_procedure.type]</oml:type>\r\n<oml:data_splits_url>[CONSTANT:base_url]/api_splits/get/[TASK:id]/Task_[TASK:id]_splits.arff</oml:data_splits_url>\r\n<oml:parameter name=\"number_repeats\">[LOOKUP:estimation_procedure.repeats]</oml:parameter>\r\n<oml:parameter name=\"number_folds\">[LOOKUP:estimation_procedure.folds]</oml:parameter>\r\n</oml:estimation_procedure>', '{\r\n  \"type\": \"select\",\r\n  \"table\": \"estimation_procedure\",\r\n  \"key\": \"id\",\r\n  \"value\": \"name\"\r\n}'),
(7, 'evaluations', 'KeyValue', 'output', 'optional', 'A list of user-defined evaluations of the task as key-value pairs.', 50, NULL, NULL, NULL),
(7, 'evaluation_measures', 'String', 'input', 'optional', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:evaluation_measures>\r\n<oml:evaluation_measure>[INPUT:evaluation_measures]</oml:evaluation_measure>\r\n</oml:evaluation_measures>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\",\r\n  \"default\": \"c_index\"\r\n}'),
(7, 'model', 'File', 'output', 'optional', 'A file containing the model built on all the input data.', 60, NULL, NULL, NULL),
(7, 'predictions', 'Predictions', 'output', 'optional', 'The desired output format', 40, NULL, '<oml:predictions>\r\n<oml:format>ARFF</oml:format>\r\n<oml:feature name=\"repeat\" type=\"integer\"/>\r\n<oml:feature name=\"fold\" type=\"integer\"/>\r\n<oml:feature name=\"row_id\" type=\"integer\"/>\r\n<oml:feature name=\"prediction\" type=\"string\"/>\r\n</oml:predictions>', NULL),
(7, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature_left>[INPUT:target_feature_left]</oml:target_feature_left>\r\n<oml:target_feature_right>[INPUT:target_feature_right]</oml:target_feature_right>\r\n<oml:target_feature_event>[INPUT:target_feature_event]</oml:target_feature_event>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset\",\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"Select a dataset to perform survival analysis on\"\r\n}'),
(7, 'target_feature_event', 'String', 'input', 'required', 'The name of the feature that indicates the type of the event.', 17, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"numeric\\\"\"\r\n}', NULL, NULL),
(7, 'target_feature_left', 'String', 'input', 'optional', 'The name of the feature that indicates the start of the interval.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"numeric\\\"\"\r\n}', NULL, NULL),
(7, 'target_feature_right', 'String', 'input', 'optional', 'The name of the feature that indicates the end of the interval.', 16, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"numeric\\\"\"\r\n}', NULL, NULL),
(8, 'quality_measure', 'String', 'input', 'required', 'The evaluation measures to optimize for, e.g., cpu time, accuracy', 30, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"math_function\"\r\n}', '<oml:quality_measure>[INPUT:quality_measure]</oml:quality_measure>', '{\r\n  \"autocomplete\": \"plain\",\r\n  \"datasource\": \"expdbEvaluationMetrics()\"\r\n}'),
(8, 'source_data', 'Dataset', 'input', 'required', 'The input data for this task', 10, '{\r\n\"data_type\": \"numeric\",\r\n\"select\": \"did\",\r\n\"from\": \"dataset\"\r\n}', '<oml:data_set>\r\n<oml:data_set_id>[INPUT:source_data]</oml:data_set_id>\r\n<oml:target_feature>[INPUT:target_feature]</oml:target_feature>\r\n<oml:target_value>[INPUT:target_value]</oml:target_value>\r\n</oml:data_set>', '{\r\n  \"name\": \"Dataset(s)\",\r\n  \"autocomplete\": \"commaSeparated\",\r\n  \"datasource\": \"expdbDatasetVersion()\",\r\n  \"placeholder\": \"(*) include all datasets\"\r\n}'),
(8, 'target_feature', 'String', 'input', 'required', 'The name of the dataset feature to be used as the target feature.', 15, '{\r\n\"data_type\": \"string\",\r\n\"select\": \"name\",\r\n\"from\": \"data_feature\",\r\n\"where\": \"did = \\\"[INPUT:source_data]\\\" AND data_type = \\\"nominal\\\"\"\r\n}', NULL, '{\r\n  \"placeholder\": \"Use default target\"\r\n}'),
(8, 'target_value', 'String', 'input', 'required', 'The value of the target feature to be used as the SD target value.', 15, '{\r\n\"data_type\": \"string\"\r\n}', NULL, '{\r\n  \"placeholder\": \"Use default target value\"\r\n}'),
(8, 'time_limit', 'Integer', 'input', 'required', 'The time limit for SD search', 30, '{\r\n\"data_type\": \"numeric\"\r\n}', '<oml:time_limit>[INPUT:time_limit]</oml:time_limit>', 'NULL');
