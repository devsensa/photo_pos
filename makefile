PROTO_DIR = res/proto
PROTO_FILES = $(PROTO_DIR)/*.proto
PROTO_OUT_DIR = lib/generated/proto

gen_proto:
	@echo Generating protobuf schema for dart: $(PROTO_FILES)
	@mkdir -p $(PROTO_OUT_DIR)
	@protoc -I=$(PROTO_DIR) --dart_out=$(PROTO_OUT_DIR) $(PROTO_FILES)

gen_models:
	flutter packages pub run build_runner build

gen: gen_proto gen_models