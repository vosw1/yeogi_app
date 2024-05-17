import 'package:yogi_project/data/repositories/scrap_repository.dart';

void main() async {
  await fetchScrap_test();
  await fetchDeleteScrap_test();
}

Future<void> fetchScrap_test() async {
  int stayId = 6;

  await ScrapRepository().fetchScrap(stayId, "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ3Mjk3NTk2LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.EdrXFTYomi9RuYxwcNdrpRFVF_7s8L6W09bpgsHbWN4BPrTHQYjSO0l3A1ljLDCvX922p2KCN99KjAZIRlf9Rw");
}

Future<void> fetchDeleteScrap_test() async {
  int stayId = 6;

  await ScrapRepository().fetchDeleteScrap(stayId, "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzdGF5Iiwicm9sZSI6InVzZXIiLCJpZCI6MSwiZXhwIjoxNzQ3Mjk3NTk2LCJlbWFpbCI6InNzYXJAbmF0ZS5jb20ifQ.EdrXFTYomi9RuYxwcNdrpRFVF_7s8L6W09bpgsHbWN4BPrTHQYjSO0l3A1ljLDCvX922p2KCN99KjAZIRlf9Rw");
}