String replaceSvgWithPng(String originalFileName) {
  if (originalFileName.endsWith('.svg')) {
    return originalFileName.replaceAll('.svg', '.png');
  } else {
    return originalFileName;
  }
}