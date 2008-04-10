#!perl

use Test::More tests => 6;

BEGIN{ use_ok( 'Astro::FITS::CFITSIO::Utils', 'colkeys' ) };

my %colkeys;

# find the first table
eval {
  %colkeys = colkeys( 'data/bintbl.fits' );
};
ok( ! $@, 'colkeys: first table'  )
    or diag $@;

is_deeply( \%colkeys, exp_colkeys(), 'colkeys: first table values' );

# give it a specific table
eval {
  %colkeys = colkeys( 'data/bintbl.fits', { extname => 'events' } );
};
ok( ! $@, 'colkeys: events table'  )
    or diag $@;

is_deeply( \%colkeys, exp_colkeys(), 'colkeys: events table values' );


# give it a bogus table
eval {
  %colkeys = colkeys( 'data/bintbl.fits', { extname => 'bogus' } );
};
ok( $@ && $@ =~ /bogus/, 'colkeys: expect exceptions' );


sub exp_colkeys {

    return {
            'time' => {
                       'hdr' => {
                                 'ttype' => 'time',
                                 'tform' => '1D'
                                },
                       'idx' => 5
                      },
            'inclip' => {
                         'hdr' => {
                                   'ttype' => 'inclip',
                                   'tform' => '1L'
                                  },
                         'idx' => 9
                        },
            'x' => {
                    'hdr' => {
                              'ttype' => 'x',
                              'tform' => '1D'
                             },
                    'idx' => 7
                   },
            'y0' => {
                     'hdr' => {
                               'ttype' => 'y0',
                               'tform' => '1D'
                              },
                     'idx' => 2
                    },
            'fitx' => {
                       'hdr' => {
                                 'ttype' => 'fitx',
                                 'tform' => '1D'
                                },
                       'idx' => 3
                      },
            'x0' => {
                     'hdr' => {
                               'ttype' => 'x0',
                               'tform' => '1D'
                              },
                     'idx' => 1
                    },
            'y' => {
                    'hdr' => {
                              'ttype' => 'y',
                              'tform' => '1D'
                             },
                    'idx' => 8
                   },
            'time0' => {
                        'hdr' => {
                                  'ttype' => 'time0',
                                  'tform' => '1D'
                                 },
                        'idx' => 6
                       },
            'fity' => {
                       'hdr' => {
                                 'ttype' => 'fity',
                                 'tform' => '1D'
                                },
                       'idx' => 4
                      }
           };
}
