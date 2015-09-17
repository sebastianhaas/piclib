#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

#include "piclib.h"

static void test_merge_uint8(void **state) {
    (void) state;
	assert_int_equal(1000, merge_uint8(0xE8, 0x03));
	assert_int_equal(345, merge_uint8(0x59, 0x01));
	assert_int_equal(0, merge_uint8(0x00, 0x00)); // Minimum value of uint16_t
	assert_int_equal(65535, merge_uint8(0xFF, 0xFF)); // Maximum value of uint16_t
	assert_int_equal(1023, merge_uint8(0xFF, 0x03)); // Maximum value a 10-bit PIC ACD will return
	assert_int_not_equal(500, merge_uint8(0xE8, 0x03));
}

static void test_convert_adc_10bit(void **state) {
    (void) state;
}

static void test_split_uint16(void **state) {
    (void) state;
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_merge_uint8),
        cmocka_unit_test(test_split_uint16),
        cmocka_unit_test(test_convert_adc_10bit)
    };
    return cmocka_run_group_tests(tests, NULL, NULL);
}
