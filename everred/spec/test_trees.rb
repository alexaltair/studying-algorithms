class Tree
  DUPLICATES = Tree.new 0, {
    1 => {
      2 => {
        2 => {}
      },
    },
    2 => {},
  }

  TAXONOMY = Tree.new :mammalia,
    {
      prototheria: {
        platypoda: {
          ornithorhynchidae: {}
        },
        tachyglossa: {
          tachyglossidae:{}
        },
      },
      theriiformes: {
        allotheria: {
          multituberculata: {
            plagiaulacidae: {},
            bolodontidae: {},
            hahnodontidae: {},
            albionbaataridae: {},
            arginbaataridae: {},
            kogaionidae: {},
            sloanbaataridae: {},
            cimolodontidae: {},
            ptilodontidae: {},
            cimolomyidae: {},
            eucosmodontidae: {},
            taeniolabididae: {},
            ferugliotheriidae: {},
            sudamericidae: {},
          },
        },
        triconodonta: {
          austrotriconodontidae: {},
          amphilestidae: {},
          triconodontidae: {},
        },
        holotheria: {
          chronoperatidae: {},
          kuehneotheria: {
            kuehneotheriidae: {},
            woutersiidae: {},
          },
          trechnotheria: {
            cladotheria: {
              zatheria: {
                tribosphenida: {
                  theria: {
                    placentalia: {
                      epitheria: {
                        preptotheria: {
                          anagalida: {
                            zambdalestidae: {},
                            anagalidae: {},
                            pseudictopidae: {},
                            macroscelidea: {
                              macroscelididae: {}
                            },
                            duplicidentata: {
                              mimotonida: {
                                mimotonidae: {}
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  RANDOM_NUMBERS = Tree.new rand(16), {
    rand(16) => {
      rand(16) => {
        rand(16) => {

        },
        rand(16) => {
          rand(16) => {

          },
        },
      },
      rand(16) => {
        rand(16) => {

        },
      },
    },
    rand(16) => {
      rand(16) => {
        rand(16) => {
          rand(16) => {

          },
        },
        rand(16) => {
          rand(16) => {

          },
          rand(16) => {
            rand(16) => {

            },
            rand(16) => {
              rand(16) => {
                rand(16) => {
                  rand(16) => {
                    rand(16) => {
                      rand(16) => {

                      },
                      rand(16) => {
                        rand(16) => {

                        },
                        2 => {

                        },
                      },
                      rand(16) => {

                      },
                    },
                  },
                },
              },
              rand(16) => {

              },
            },
          },
        },
      },
      rand(16) => {
        rand(16) => {
          rand(16) => {
            rand(16) => {

            },
            rand(16) => {

            },
            rand(16) => {

            },
            rand(16) => {
              rand(16) => {
                rand(16) => {

                },
                rand(16) => {

                },
                rand(16) => {
                  rand(16) => {
                    rand(16) => {

                    },
                  },
                },
                rand(16) => {

                },
              },
              rand(16) => {

              },
            },
            rand(16) => {

            },
            rand(16) => {

            },
            rand(16) => {

            },
            rand(16) => {

            },
          },
          rand(16) => {

          },
        },
      },
      rand(16) => {
        rand(16) => {

        },
        rand(16) => {

        },
      },
      rand(16) => {
        rand(16) => {
          rand(16) => {

          },
        },
        rand(16) => {

        },
        rand(16) => {
          rand(16) => {

          },
        },
      },
      rand(16) => {
        rand(16) => {

        },
      },
    },
    rand(16) => {
      rand(16) => {
        rand(16) => {

        },
      },
    },
    rand(16) => {
      rand(16) => {
        rand(16) => {
          rand(16) => {

          },
        },
        rand(16) => {

        },
        rand(16) => {

        },
      },
      rand(16) => {
        rand(16) => {

        },
      },
    },
    rand(16) => {
      rand(16) => {

      },
      rand(16) => {
        rand(16) => {
          rand(16) => {
            rand(16) => {
              rand(16) => {

              },
              rand(16) => {

              },
            },
            rand(16) => {
              rand(16) => {
                rand(16) => {

                },
                rand(16) => {

                },
              },
              rand(16) => {
                rand(16) => {

                },
              },
              rand(16) => {
                rand(16) => {

                },
              },
            },
          },
        },
        rand(16) => {
          rand(16) => {

          },
        },
      },
      rand(16) => {
        rand(16) => {

        },
      },
      rand(16) => {
        rand(16) => {
          rand(16) => {
            1 => {

            },
            0 => {

            },
          },
        },
      },
    },
  }
end
