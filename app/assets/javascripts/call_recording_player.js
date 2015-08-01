var getCallRecordingHTML = function(id, recording) {
  var html = '<div class="jp-jplayer" id="jquery_jplayer_' + id + '"></div>' +
                      '<div aria-label="media player" class="jp-audio" id="jp_container_' + id + '" role="application">' +
                          '<div class="jp-type-single">' +
                              '<div class="jp-gui jp-interface">' +
                                  '<div class="jp-controls-holder">' +
                                      '<div class="jp-controls">' +
                                          '<a class="btn btn-xs btn-info jp-play" role="button" tabindex="0">Play</a>' +
                                          '<a class="btn btn-xs btn-info jp-pause" role="button" tabindex="0">Pause</a>' +
                                      '</div>' +
                                  '</div>' +
                              '</div>' +
                          '</div>' +
                      '</div>' +
                      '<script>' +

                          '$("#jquery_jplayer_' + id + '").jPlayer({' +
                              'ready: function () {' +
                                  '$(this).jPlayer("setMedia", {' +
                                      'mp3: "' + recording + '",' +
                                  '});' +
                              '},' +
                              'cssSelectorAncestor: "#jp_container_' + id + '",' +
                              'solution: "flash,html",' +
                              'swfPath: "/swf/jquery.jplayer.swf",' +
                              'supplied: "mp3"' +
                          '});' +

                      '</script>'

  return html;
}