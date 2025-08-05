# Python BackEnd DevKit

Python 개발을 위한 DevContainer 환경

## 시작하기

1. **DevContainer 빌드**
   ```bash
   # VS Code에서 DevContainer 실행
   ```

2. **Claude Code MCP 서버 설정** (최초 1회만)
   
   DevContainer 빌드 완료 후,  
   Claude Code에 로그인한 상태에서 다음 명령어를 터미널에서 실행하세요:
   
   ```bash
   claude mcp add serena /workspace/.mcp/start-serena.sh
   ```

3. **MCP 서버 확인**
   
   Claude Code에서 다음 명령어로 확인:
   ```
   /mcp
   ```

## 포함된 도구들

- **Python 3.12**: 기본 Python 환경
- **Claude Code**: Anthropic Claude AI 어시스턴트
- **Serena MCP**: AI 코딩 어시스턴트 (Python 3.11.13 가상환경)

## MCP 서버 수동 실행

필요시 Serena MCP 서버를 수동으로 실행할 수 있습니다:

```bash
cd .mcp
./start-serena.sh
```

## 트러블슈팅

- MCP 서버가 인식되지 않는 경우: Claude Code 재시작 후 다시 시도
- 권한 오류: `chmod +x .mcp/start-serena.sh` 실행