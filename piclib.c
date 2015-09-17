#include "piclib.h"

uint16_t merge_uint8(uint8_t lowerBits, uint8_t higherBits)
{
	uint16_t result = ((uint16_t)higherBits << 8) | lowerBits;
	return result;
}

uint16_t convert_adc_10bit(uint8_t ADRESH, uint8_t ADRESL)
{
	uint16_t result;
	result = ADRESH;
    result <<=8;
    result |= ADRESL;
    return result;
}

void split_uint16(uint8_t *result, uint16_t value)
{
	result[0] = value & 0xFF;
	result[1] = value >> 8;
	return;
}