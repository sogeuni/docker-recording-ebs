
[![Docker Automated build](https://img.shields.io/docker/automated/sogeuni/recording-ebs.svg)](https://hub.docker.com/r/sogeuni/recording-ebs/) 
[![Docker Build Status](https://img.shields.io/docker/build/sogeuni/recording-ebs.svg)](https://hub.docker.com/r/sogeuni/recording-ebs/)

# Docker image for recording EBS

EBS 방송 녹음을 위한 Docker 이미지

동작에 문제가 있으면, [이 곳](https://github.com/sogeuni/docker-recording-ebs/issues)에 이슈 등록하시면 수정토록 하겠습니다.

## Usage

```bash
docker run --rm -it -v /로컬/디렉토리:/recording recording-ebs:latest "프로그램 명" 20
```

위와 같이 실행하면 `/로컬/디렉토리/프로그램 명/1807/20180704_프로그램-명.mp3` 의 형태로 20분 간의 녹음 파일이 저장됩니다.

## TODO

* [ ] mp3 태깅
* [ ] 외부 환경설정 파일
* [ ] 팟캐스트 기능
* [ ] ...
